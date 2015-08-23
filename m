From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/7] regulators: max77693: register driver earlier to
 avoid deferred probe
Date: Sun, 23 Aug 2015 12:50:02 +0900
Message-ID: <55D942EA.7000200@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com> <1440160723-6636-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440160723-6636-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 21.08.2015 o 21:38, Marek Szyprowski pisze:
> MAX77693 based regulators are used by USB gadget subsystem, which
> doesn't support deferred probe, so the driver should be registered
> before USB gadget drivers get probed.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/regulator/max77693.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
