From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RESEND PATCH v2 6/6] ARM: dts: Mark eMMC as non-removable in
 exynos5250-snow-common
Date: Wed, 18 Nov 2015 10:32:48 -0300
Message-ID: <564C7E00.9070704@osg.samsung.com>
References: <1447853034-22508-1-git-send-email-javier@osg.samsung.com>
 <1447853034-22508-7-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447853034-22508-7-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 11/18/2015 10:23 AM, Javier Martinez Canillas wrote:
> The eMMC is non-removable so mark it using the non-removable DT
> property to avoid having to redetect it after a suspend/resume.
> 
> Also remove the card-detect-delay property that is not needed with
> non-removable.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Tested-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Series-cc Alim Akhtar <alim.akhtar@samsung.com>

Argh, sorry about this, it was a silly typo error where I forgot ':' so
patman didn't process the tag...

I guess it can be removed when applying to avoid resending the whole series.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
