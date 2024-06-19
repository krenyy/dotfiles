export { }

const battery = await Service.import('battery')

const Bar = (/** @type {number} */ monitor_num) =>
  Widget.Window({
    monitor: monitor_num,
    name: `bar${monitor_num}`,
    anchor: ['top', 'left', 'right'],
    child: Widget.CircularProgress({ value: battery.bind('percent').as(p => p / 100) })
  });

App.config({
  windows: [Bar(0)],
});
