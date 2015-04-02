From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/2] ARM: dts: Use last parent for clocks during power
 domain on/off
Date: Thu, 02 Apr 2015 14:30:51 +0200
Message-ID: <551D367B.2020104@collabora.co.uk>
References: <1427961979-29477-1-git-send-email-k.kozlowski@samsung.com> <1427961979-29477-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427961979-29477-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 04/02/2015 10:06 AM, Krzysztof Kozlowski wrote:
> Replace fixed parent with last parent (obtained with clk_get_parent())
> of clocks for devices in mfc and disp power domains. This should improve
> behavior if such clocks were reparented by the drivers and new parents
> are different than those specified in DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On an Exynos5420 Peach Pit Chromebook:

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
