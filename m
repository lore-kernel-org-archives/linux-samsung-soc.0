From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 06 Oct 2014 17:40:43 +0300
Message-ID: <353158006.4Zqtrv9CtX@avalon>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <20140923144509.GF5982@ulmo> <542283DE.5040909@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <542283DE.5040909@ti.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomi,

On Wednesday 24 September 2014 11:42:06 Tomi Valkeinen wrote:
> On 23/09/14 17:45, Thierry Reding wrote:
> > On Tue, Sep 23, 2014 at 02:31:35PM +0300, Tomi Valkeinen wrote:
> >> On 23/09/14 12:39, Thierry Reding wrote:
> >>> My point is that if you use plain phandles you usually have the
> >>> meta-data already. Referring to the above example, bridge0 knows that it
> >>> should look for a bridge with phandle &bridge1, whereas bridge1 knows
> >>> that the device it is connected to is a panel.
> >> 
> >> The bridge should not care what kind of device is there on the other
> >> end. The bridge just has an output, going to another video component.
> > 
> > You'll need to know at some point that one of the devices in a panel,
> > otherwise you can't treat it like a panel.
> 
> The bridge doesn't need to treat it like a panel. Someone else might,
> though. But the panel driver knows it is a panel, and can thus register
> needed services, or mark itself as a panel.
> 
> >>>> Well, I can't say about this particular bridge, but afaik you can
> >>>> connect a parallel RGB signal to multiple panels just like that,
> >>>> without any muxing.
> >>> 
> >>> Right, but in that case you're not reconfiguring the signal in any way
> >>> for each of the panels. You send one single signal to all of them. For
> >> 
> >> Yes, that's one use case, cloning. But I was not talking about that.
> >> 
> >>> all intents and purposes there is only one panel. Well, I guess you
> >>> could have separate backlights for the panels. In that case though it
> >>> seems better to represent it at least as a virtual mux or bridge, or
> >>> perhaps a "mux panel".
> >> 
> >> I was talking about the case where you have two totally different
> >> devices, let's say panels, connected to the same output. One could take
> >> a 16-bit parallel RGB signal, the other 24-bit. Only one of them can  be
> >> enabled at a time (from HW perspective both can be enabled at the same
> >> time, but then the other one shows garbage).
> > 
> > So we're essentially back to a mux, albeit maybe a virtual one.
> 
> Yes. Are you suggesting to model virtual hardware in .dts? I got the
> impression that you wanted to model only the real hardware in .dts =).
> 
> But seriously speaking, I was thinking about this. I'd really like to
> have a generic video-mux node, that would still somehow allow us to have
> device specific configurations for the video sources and sinks (which
> the endpoints provide us), without endpoints.
> 
> The reason endpoints don't feel right in this case is that it makes
> sense that the mux has a single input and two outputs, but with
> endpoints we need two endpoints from the bridge (which is still ok), but
> we also need two endpoitns in the mux's input side, which doesn't feel
> right.
> 
> I came up with the following. It's quite ugly, though. I hope someone
> has ideas how it could be done in a neater way:
> 
> bridge1234 {
> 	bridge1234-cfg1: config1 {
> 		high-voltage;
> 	};
> 
> 	bridge1234-cfg2: config2 {
> 		low-voltage;
> 	};
> 
> 	output = <&mux>;
> };
> 
> mux: video-gpio-mux {
> 	gpio = <123>;
> 
> 	outputs = <&panel1 &panel2>;
> 	input-configs = <&bridge1234-cfg1 &bridge1234-cfg2>;
> };
> 
> panel1: panel-foo {
> 
> };
> 
> panel2: panel-foo {
> 
> };
> 
> So the bridge node has configuration sets. These might be compared to
> pinmux nodes. And the mux has a list of input-configs. When panel1 is to
> be enabled, "bridge1234-cfg1" config becomes active, and the bridge is
> given this configuration.
> 
> I have to say the endpoint system feels cleaner than the above, but
> perhaps it's possible to improve the method above somehow.

Isn't it possible for the bridge to compute its configuration at runtime by 
querying properties of the downstream video entities ? That would solve the 
problem neatly.

-- 
Regards,

Laurent Pinchart
