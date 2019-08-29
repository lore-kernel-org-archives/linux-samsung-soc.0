From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/2 RESEND] usb: core: phy: add support for PHY
 calibration
Date: Thu, 29 Aug 2019 07:26:50 +0200
Message-ID: <e801e7a4-f525-baae-4c02-d271db308b5f@samsung.com>
References: <20190808094128.27213-1-m.szyprowski@samsung.com>
        <CGME20190808094146eucas1p2a5a88ce5e7a87d47c4bcececab4df9a5@eucas1p2.samsung.com>
        <20190808094128.27213-2-m.szyprowski@samsung.com>
        <a380a635-e036-1a18-bc0f-947931f8735c@samsung.com>
        <20190828204146.GA21235@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828204146.GA21235@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Greg,

On 2019-08-28 22:41, Greg Kroah-Hartman wrote:
> On Mon, Aug 26, 2019 at 10:55:33AM +0200, Marek Szyprowski wrote:
>> Hi Greg
>>
>> On 2019-08-08 11:41, Marek Szyprowski wrote:
>>> Some PHYs (for example Exynos5 USB3.0 DRD PHY) require calibration to be
>>> done after every USB HCD reset. Generic PHY framework has been already
>>> extended with phy_calibrate() function in commit 36914111e682 ("drivers:
>>> phy: add calibrate method"). This patch adds support for it to generic
>>> PHY handling code in USB HCD core.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Anand Moon <linux.amoon@gmail.com>
>>> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
>> Greg: any chance to give it this a try in -next? If not, maybe You can
>> point someone whose review will help?
> Ah crap, this is me, not the PHY maintainer :(
>
> Can you resend this and I will be glad to review it.  But it would also
> be good to get Felipe's review as well.

No problem, I will resend it again in a few minutes. Felipe already 
acked it: https://lkml.org/lkml/2019/8/8/460

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
