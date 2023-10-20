import { LightningElement, api, wire } from "lwc";

import { getRecord, notifyRecordUpdateAvailable } from "lightning/uiRecordApi";
import { getLocationService } from "lightning/mobileCapabilities";

import {
  registerRefreshContainer,
  unregisterRefreshContainer,
  REFRESH_ERROR,
  REFRESH_COMPLETE,
  REFRESH_COMPLETE_WITH_ERRORS
} from "lightning/refresh";

export default class MiniChartsUpdateUtility extends LightningElement {
  @api prop1 = false;
  @api recordId;

  async handleClick() {
    // console.log("recordId", window.location);

    // const myLocationService = getLocationService();
    // if (myLocationService.isAvailable()) {
    //   // Perform location-based requests
    //   console.log("Available", myLocationService);
    // } else {
    //   console.log("NOT Available");
    //   // LocationService isn’t available
    //   // Not running on hardware with GPS, or not inside mobile app
    //   // Handle with message, error, beep, and so on
    // }

    // notifyRecordUpdateAvailable(["001Hs00002vtXNnIAM"]);
    const x = await notifyRecordUpdateAvailable([
      { recordId: "001Hs00002vtXNnIAM" }
    ]);
    console.log("x", x);
  }

  @wire(getRecord, { recordId: "$recordId", fields: ["id"] })
  record;

  async handler() {
    console.log("handler");

    // Do something before the record is updated
    // showSpinner();

    // Update the record via Apex
    // await apexUpdateRecord(this.recordId);

    // Notify LDS that you've changed the record outside its mechanisms
    // Await the Promise object returned by notifyRecordUpdateAvailable()
    // await notifyRecordUpdateAvailable([{recordId: this.recordId}]);
    // hideSpinner();
  }

  connectedCallback() {
    this.refreshContainerID = registerRefreshContainer(
      this,
      this.refreshContainer
    );
    // if the component runs in an org with Lightning Locker instead of LWS, use
    // this.refreshContainerID = registerRefreshContainer(this.template.host, this.refreshContainer.bind(this));
  }
  disconnectedCallback() {
    unregisterRefreshContainer(this.refreshContainerID);
  }

  refreshContainer(refreshPromise) {
    console.log("refreshing");
    return refreshPromise.then((status) => {
      if (status === REFRESH_COMPLETE) {
        console.log("Done!");
      } else if (status === REFRESH_COMPLETE_WITH_ERRORS) {
        console.warn("Done, with issues refreshing some components");
      } else if (status === REFRESH_ERROR) {
        console.error("Major error with refresh.");
      }
    });
  }
}
