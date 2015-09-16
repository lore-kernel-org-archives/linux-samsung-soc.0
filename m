From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable USB Video Class support
Date: Thu, 17 Sep 2015 07:59:14 +0900
Message-ID: <55F9F442.60905@kernel.org>
References: <1442232259-777-1-git-send-email-javier@osg.samsung.com> <55F7602C.5060108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55F7602C.5060108@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/15/15 09:02, Krzysztof Kozlowski wrote:
> On 14.09.2015 21:04, Javier Martinez Canillas wrote:
>> The Exynos5420 Peach Pit and Exynos5800 Peach Pi boards have a built-in
>> Silicon Motion USB UVC WebCam. Enable support for the USB Video Class
>> driver and its needed media Kconfig symbols so the camera is supported.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>> Changes in v2:
>> - Enable tristate Kconfig options as module instead of built-in.
>>   Suggested by Krzysztof Kozlowski.
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
Applied, thanks.

- Kukjin
