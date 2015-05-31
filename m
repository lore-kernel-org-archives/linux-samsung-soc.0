From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 1/2] usb: ehci-exynos: Make provision for vdd regulators
Date: Sun, 31 May 2015 15:34:31 +0900
Message-ID: <CAJKOXPeccCOBd6-jMJSZVtNMR82EUztZexqv1qParC9ad=YOtA@mail.gmail.com>
References: <CAFp+6iF9GkKWDcqZNV58Z=U3ZDQdgYr8LJBF9t-BpJW90vsHdQ@mail.gmail.com>
	<1403700144-30720-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1403700144-30720-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Jingoo Han <jg1.han@samsung.com>, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-samsung-soc@vger.kernel.org

2014-06-25 21:42 GMT+09:00 Vivek Gautam <gautam.vivek@samsung.com>:
> Facilitate getting required 3.3V and 1.0V VDD supply for
> EHCI controller on Exynos.
>
> With the patches for regulators' nodes merged in 3.15:
> c8c253f ARM: dts: Add regulator entries to smdk5420
> 275dcd2 ARM: dts: add max77686 pmic node for smdk5250,
> the exynos systems turn on only minimal number of regulators.
>
> Until now, the VDD regulator supplies were either turned on
> by the bootloader, or the regulators were enabled by default
> in the kernel, so that the controller drivers did not need to
> care about turning on these regulators on their own.
> This was rather bad about these controller drivers.
> So ensuring now that the controller driver requests the necessary
> VDD regulators (if available, unless there are direct VDD rails),
> and enable them so as to make them working.
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> ---
>
> Changes from v2:
>  - replaced devm_regulator_get() with devm_regulator_get_optional().
>  - Added Documentation for the vdd supplies for the controller.
>  - Re-did the commit message.

The patch looks useful but it seems it was forgotten. Do you have any
plans to resend it?

Best regards,
Krzysztof
