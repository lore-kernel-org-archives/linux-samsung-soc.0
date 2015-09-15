From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: Split audio configuration to separateexynos5422-odroidxu3-audio
Date: Wed, 16 Sep 2015 07:35:52 +0900
Message-ID: <55F89D48.900@kernel.org>
References: <1442191669-3366-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442191669-3366-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/14/15 09:47, Krzysztof Kozlowski wrote:
> The Odroid XU4 board does not have audio codec so before adding DTS for
> new board split the audio codec to separate DTSI file. Include the audio codec
> DTSI in Odroid XU3 and XU3-Lite boards.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
Applied 1-2.

Thanks,
Kukjin
