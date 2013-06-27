From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 1/5] phy: Add driver for Exynos MIPI CSIS/DSIM DPHYs
Date: Thu, 27 Jun 2013 10:37:12 +0200
Message-ID: <51CBF9B8.70103@samsung.com>
References: <1372258946-15607-1-git-send-email-s.nawrocki@samsung.com>
 <1372258946-15607-2-git-send-email-s.nawrocki@samsung.com>
 <20130627075223.GQ15455@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <20130627075223.GQ15455@arwen.pp.htv.fi>
Sender: linux-media-owner@vger.kernel.org
To: balbi@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kishon@ti.com, linux-media@vger.kernel.org, kyungmin.park@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, dh09.lee@samsung.com, jg1.han@samsung.com, inki.dae@samsung.com, plagnioj@jcrosoft.com, linux-fbdev@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/27/2013 09:52 AM, Felipe Balbi wrote:
> On Wed, Jun 26, 2013 at 05:02:22PM +0200, Sylwester Nawrocki wrote:
>> Add a PHY provider driver for the Samsung S5P/Exynos SoC MIPI CSI-2
>> receiver and MIPI DSI transmitter DPHYs.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Acked-by: Felipe Balbi <balbi@ti.com>

Thank you for your review and ack!

Just for the record, I have tested this driver as a loadable
module on Exynos4412 TRATS2 board and it all worked fine for
both the camera and display side.

--
Regards,
Sylwester
