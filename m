From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] pinctrl-exynos5440: Use off-stack memory for
 pinctrl_gpio_range
Date: Wed, 20 Apr 2016 08:56:26 +0200
Message-ID: <5717281A.70906@samsung.com>
References: <1461117257-27048-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1461117257-27048-1-git-send-email-andrew@aj.id.au>
Sender: stable-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/20/2016 03:54 AM, Andrew Jeffery wrote:
> The range is registered into a linked list which can be referenced
> throughout the lifetime of the driver. Ensure the range's memory is useful
> for the same lifetime by adding it to the driver's private data structure.
> 
> The bug was introduced in the driver's initial commit, which was present in
> v3.10.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Fixes: f0b9a7e521fa ("pinctrl: exynos5440: add pinctrl driver for Samsung EXYNOS5440 SoC")
> Cc: stable@vger.kernel.org
> ---
> Since v1:
> 
> * Add range member kerneldoc addressing Tomasz Figa's comment
> 
> This is my first contribution to the kernel, so hopefully I've followed all the
> relevant documentation. If not, please let me know and point me in the right
> direction!
> 
> I don't have the means to test the patch, but it compiles. Someone with
> appropriate hardware should probably give it a spin. From the responses it
> seems that few might have access, and given the nature of the bug it might be
> the case that no-one has complained because no-one is affected - is it worth
> maintaining going forward?
> 
>  drivers/pinctrl/samsung/pinctrl-exynos5440.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Thank you for your contribution. You already received positive feedback
on v1 of this patch: Tomasz acked it ("acked-by") and I reviewed it
("reviewed-by"). These are called "tags".

When you resubmit patches (unless there is a significant change in the
patch) please always put accumulated tags after existing tags. Usually
after signed-off-by, in this case after Cc-stable, so this would look like:

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Fixes: f0b9a7e521fa ("pinctrl: exynos5440: add pinctrl driver for
Samsung EXYNOS5440 SoC")
Cc: stable@vger.kernel.org
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
