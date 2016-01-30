From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] regulator: max77802: Fix DT binding document reference
Date: Sat, 30 Jan 2016 11:09:12 +0900
Message-ID: <56AC1B48.5090504@samsung.com>
References: <1454083741-25626-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454083741-25626-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 30.01.2016 o 01:09, Javier Martinez Canillas pisze:
> The DT binding doc references the max77802 clocks header file which makes
> no sense since of course it doesn't contain data related to the regulators.
> 
> It's a copy and paste error, so add a reference to the correct header file.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/regulator/max77802.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
