From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 06 Oct 2014 16:55:29 +0300
Message-ID: <2105361.oKR82DcFZc@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <20140925062324.GB12423@ulmo> <54327E28.5050400@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54327E28.5050400@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomi and Thierry,

On Monday 06 October 2014 14:34:00 Tomi Valkeinen wrote:
> On 25/09/14 09:23, Thierry Reding wrote:
> > How are cameras different? The CPU wants to capture video data from the
> > camera, so it needs to go look for a video capture device, which in turn
> > needs to involve a sensor.
> 
> Let's say we have an XXX-to-YYY encoder. We use that encoder to convert
> the SoC's XXX output to YYY, which is then shown on a panel. So, in this
> case, the encoder's DT node will have a "panel" or "output" phandle,
> pointing to the panel.
> 
> We then use the exact same encoder in a setup in which we have a camera
> which outputs XXX, which the encoder then converts to YYY, which is then
> captured by the SoC. Here the "output" phandle would point to the SoC.

phandles are pretty simple and versatile, which is one of the reasons why they 
are widely used. The drawback is that they are used to model totally different 
concepts, which then get mixed in our brains.

The DT nodes that make a complete system are related in many different ways. 
DT has picked one of those relationships, namely the control parent-child 
relationship, made it special, and arranged the nodes in a tree structure 
based on those relationships. As Thierry mentioned this make sense given that 
DT addresses the lack of discoverability from a CPU point of view.

As many other relationships between nodes had to be represented in DT phandles 
got introduced. One of their use cases is to reference resources required by 
devices, such as GPIOs, clocks and regulators. In those cases the distinction 
between the resource provider and the resource user is clear. The provider and 
user roles are clearly identified in the relationship, with the user being the 
master and the provider being the slave.

After those first two classes of relationships (control parent/child and 
resource provider/user), a need to specify data connections in DT arose. 
Different models got adopted depending on the subsystems and/or devices, all 
based on phandles.

I believe this use case is different compared to the first two in that it 
defines connections, not master/slave relationships. The connection doesn't 
model which entity control or use the other (if any), but how data flows 
between entities. There is no clear master or slave in that model, different 
control models can then be implemented in device drivers depending on the use 
cases, but those are very much implementation details from a DT point of view. 
The composite device model used for display drivers (and camera drivers for 
that matter) usually sets all devices on equal footing, and then picks a 
master (which can be one of the hardware devices, or a virtual logical device) 
depending on the requirements of the kernel and/or userspace subsystem(s).

I thus don't think there's any point in arguing which entity is the resource 
and which entity is the user in this discussion, as that should be unrelated 
to the DT bindings. If we need to select a single phandle direction from a 
hardware description point of view, the only direction that makes sense is one 
based on the data flow direction. Making phandles always point outwards or 
inwards from the CPU point of view doesn't make sense, especially when the CPU 
doesn't get involved as a data point in a media pipeline (think about a 
connector -> processing -> connector pipeline for instance, where data will be 
processed by hardware only without going through system memory at any point).

Now, we also have to keep in mind that the DT description, while it should 
model the hardware, also needs to be usable from a software point of view. A 
hardware model that would precisely describe the system in very convoluted 
ways wouldn't be very useful. We thus need to select a model that will ease 
software development, while only describing the hardware and without depending 
on a particular software implementation. That model should be as simple as 
possible, but doesn't necessarily need to be the simplest model possible if 
that would result in many implementation issues.

I think the OF graph model is a good candidate here. It is unarguably more 
complex than a single phandle, but it also makes different software 
implementations possible while still keeping the DT completely low.

> >>> If you go the other way around, how do you detect how things connect?
> >>> Where do you get the information about the panel so you can trace back
> >>> to the origin?
> >> 
> >> When the panel driver probes, it registers itself as a panel and gets
> >> its video source. Similarly a bridge in between gets its video source,
> >> which often would be the SoC, i.e. the origin.
> > 
> > That sounds backwards to me. The device tree serves the purpose of
> > supplementing missing information that can't be probed if hardware is
> > too stupid. I guess that's one of the primary reasons for structuring it
> > the way we do, from the CPU point of view, because it allows the CPU to
> > probe via the device tree.
> > 
> > Probing is always done downstream, so you'd start by looking at some
> > type of bus interface and query it for what devices are present on the
> > bus. Take for example PCI: the CPU only needs to know how to access the
> > host bridge and will then probe devices behind each of the ports on that
> > bridge. Some of those devices will be bridges, too, so it will continue
> > to probe down the hierarchy.
> > 
> > Without DT you don't have a means to know that there was a panel before
> > you've actually gone and probed your whole hierarchy and found a GPU
> > with some sort of output that a panel can be connected to. I think it
> > makes a lot of sense to describe things in the same way in DT.
> 
> Maybe I don't quite follow, but it sounds to be you are mixing control
> and data. For control, all you say is true. The CPU probes the devices
> on control busses, either with the aid of HW or the aid of DT, going
> downstream.
> 
> But the data paths are a different matter. The CPU/SoC may not even be
> involved in the whole data path. You could have a sensor on the board
> directly connected to a panel. Both are controlled by the CPU, but the
> data path goes from the sensor to the panel (or vice versa). There's no
> way the data paths can be "CPU centric" in that case.
> 
> Also, a difference with the data paths compared to control paths is that
> they are not strictly needed for operation. An encoder can generate an
> output without enabling its input (test pattern or maybe blank screen,
> or maybe a screen with company logo). Or an encoder with two inputs
> might only get the second input when the user requests a very high res
> mode. So it is possible that the data paths are lazily initialized.
> 
> You do know that there is a panel right after the device is probed
> according to its control bus. It doesn't mean that the data paths are
> there yet. In some cases the user space needs to reconfigure the data
> paths before a panel has an input and can be used to show an image from
> the SoC's display subsystem.
> 
> The point here being that the data path bindings don't really relate to
> the probing part. You can probe no matter which way the data path
> bindings go, and no matter if there actually exists (yet) a probed
> device on the other end of a data path phandle.
> 
> While I think having video data connections in DT either way, downstream
> or upstream, would work, it has felt most natural for me to have the
> phandles from video sinks to video sources.
> 
> The reason for that is that I think the video sink has to be in control
> of its source. It's the sink that tells the source to start or stop or
> reconfigure. So I have had need to get the video source from a video
> sink, but I have never had the need to get the video sinks from video
> sources.

We could decide to model all data connections are phandles that go in the data 
flow direction (source to sink), opposite to the data flow direction (sink to 
source), or in both directions. The problem with the sink to source direction 
is that it raises the complexity of implementations for display drivers, as 
the master driver that will bind all the components together will have a hard 
time locating the components in DT if all the components point towards it. 
Modeling the connections in the source to sink direction only would create the 
exact same problem for video capture (camera) devices. That's why I believe 
that bidirectional connections would be a better choice.

-- 
Regards,

Laurent Pinchart
