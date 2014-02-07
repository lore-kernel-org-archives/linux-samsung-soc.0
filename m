From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 1/2] regulator: s5m8767: Use GPIO for controlling
 Buck9/eMMC
Date: Fri, 07 Feb 2014 13:40:33 +0100
Message-ID: <1391776833.16500.1.camel@AMDC1943>
References: <1390570678-30686-1-git-send-email-k.kozlowski@samsung.com>
 <1390570678-30686-2-git-send-email-k.kozlowski@samsung.com>
 <20140127202524.GQ11841@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140127202524.GQ11841@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On Mon, 2014-01-27 at 20:25 +0000, Mark Brown wrote:
> On Fri, Jan 24, 2014 at 02:37:57PM +0100, Krzysztof Kozlowski wrote:
> > Add support for GPIO control (enable/disable) over Buck9. The Buck9
> > Converter is used as a supply for eMMC Host Controller.
> 
> Applied, thanks.

I can't find these patches in your tree. Did you applied them or am I
missing something?

Best regards,
Krzysztof
