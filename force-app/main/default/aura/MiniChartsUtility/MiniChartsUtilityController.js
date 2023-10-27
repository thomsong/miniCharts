({
  doInit: function (cmp) {
    // setInterval(() => {
    //   $A.get("e.force:refreshView").fire();
    // }, 5000);
  },

  setUtilityIcon: function (component, event, helper) {
    // var utilityAPI = component.find("utilitybar");
    // utilityAPI.setUtilityIcon({ icon: "insert_tag_field" });

    setInterval(() => {
      $A.get("e.force:refreshView").fire();
    }, 5000);
  },

  onRecordIdChange: function (component, event, helper) {
    var newRecordId = component.get("v.recordId");
    console.log(newRecordId);
  }
});