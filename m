From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Tue, 27 May 2014 23:24:49 +0900
Message-ID: <CAAQKjZOGLPoGbZ7G3+BFd3ydRC2HGmz8JKqFiytdSvxN3T5U_w@mail.gmail.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
 <20140526134153.GA2373@ulmo> <538430A4.8020702@samsung.com>
 <20140527075328.GA13081@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140527075328.GA13081@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

2014-05-27 16:53 GMT+09:00 Thierry Reding <thierry.reding@gmail.com>:
> On Tue, May 27, 2014 at 08:28:52AM +0200, Andrzej Hajda wrote:
>> Hi Thierry,
>>
>> On 05/26/2014 03:41 PM, Thierry Reding wrote:
>> > On Wed, May 21, 2014 at 01:43:05PM +0900, YoungJun Cho wrote:
>> >> This patch adds DT bindings for s6e3fa0 panel.
>> >> The bindings describes panel resources, display timings and cpu mode timings.
>> >>
>> >> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> >> Acked-by: Inki Dae <inki.dae@samsung.com>
>> >> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> >> ---
>> >>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++++++++++++++++++++
>> >>  1 file changed, 45 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>> > You're totally confusing me here. Half of this patch series is about
>> > adding i80 support to Exynos FIMD, and then you go and add what is
>> > apparently a DSI peripheral driver here that's supposed to be used by
>> > this new i80 support. Nothing I've been able to dig up indicates that
>> > i80 or DSI are in anyway related.
>>
>> FIMD can produce parallel RGB output or command mode in i80 style output
>> via parallel lines.
>> DSIM can accept parallel RGB stream in this case it produces MIPI DSI
>> video mode signal or it can accept i80 and in this case it translates it
>> to MIPI DSI command mode.
>
> Then the command mode timings aren't a property of the panel at all.

Then the video mode timings aren't also a property of the panel.

Which interface mipi and display controller should use would be
decided by lcd panel type: display controller can use i80 interface
based lcd panel, and also mipi controller can use i80 interface based
lcd panel.
In here, the only difference is that lcd panel receives  packets,
which includes video data or command data, packed with mipi protocol
via lane lines or receives video data or command data via parallel
lines.

And the below is LCD types,
        RGB interface panel.
        i80 interface panel.
        MIPI based RGB interface panel.
        MIPI based i80 interface panel.

RGB interface also is called video mode, and i80 interface also is
called cpu mode. In case of omap SoC, it is also called Smart panel.
i80 interface is just one of LCD types. So I think this interface
timings should be handled by frameworks related to mode in same way as
RGB interface.

Thanks,
Inki Dae

> They describe what DSIM expects, so that's where they should be defined.
>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
