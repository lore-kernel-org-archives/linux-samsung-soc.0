From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
	panel nodes
Date: Tue, 04 Mar 2014 13:00:59 +0100
Message-ID: <5315C07B.3090705@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
	<1392204688-4591-20-git-send-email-a.hajda@samsung.com>
	<53108FA0.4040903@ti.com> <53109193.3000604@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53109193.3000604@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/28/2014 02:39 PM, Tomi Valkeinen wrote:
> On 28/02/14 15:31, Tomi Valkeinen wrote:
>
>> Compared to what I've done on OMAP, you don't seem to specify the video
>> inputs for the tc358764 at all. In this case it's obvious, as the chip
>> is a child of the DSI master. But the chip could as well be controlled
>> via i2c, and so be placed as a child of the i2c nodes.
>>
>> So even if the driver doesn't use it, maybe it would be more future
>> proof to have both input and output endpoints for the tc358764?
> Oh, and one addition: how me and Laurent see the DSI case (and other
> similar ones), the child/parent relationship gives the control bus path,
> and the video ports give the video data path.
>
> So both are always needed. A DSI panel may be controlled via DSI, i2c,
> spi, but the video path will always go from DSI master to the panel.
I have made video path binding optional, in case of video bus
if the specific video path is not present driver uses the bus it is
connected to.
In case DSI panel is controlled via different bus the path should be
specified
explicitly.

I have no strong feelings against making this binding required but as
you have
stated above "in this case it's obvious" and for me quite redundant.

What is the gain in specifying explicitly video paths in such cases?
 

> Or, as a theoretical panel, you could have a DSI controlled panel, being
> a child of the DSI master, but the video data would come via, say,
> parallel RGB. You can actually do that with some panels/encoders, even
> if the concept is silly.

In this case explicit binding will work also.

Regards
Andrzej
