From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: mainline/master boot bisection: v5.0-4854-g8dcd175bc3d5 on odroid-xu3
Date: Thu, 7 Mar 2019 08:30:27 +0100
Message-ID: <CAJKOXPfVxb+aQnqCePgF4EedH5vPtA3BWhqbTTNAa7pAOOYB_Q@mail.gmail.com>
References: <5c80c49b.1c69fb81.605bf.26ea@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5c80c49b.1c69fb81.605bf.26ea@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "kernelci.org bot" <bot@kernelci.org>
Cc: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com, broonie@kernel.org, matthew.hart@linaro.org, Herbert Xu <herbert@gondor.apana.org.au>, khilman@baylibre.com, enric.balletbo@collabora.com, Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-crypto@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Mar 2019 at 08:13, kernelci.org bot <bot@kernelci.org> wrote:
>
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>
> mainline/master boot bisection: v5.0-4854-g8dcd175bc3d5 on odroid-xu3
>
> Summary:
>   Start:      8dcd175bc3d5 Merge branch 'akpm' (patches from Andrew)
>   Details:    https://kernelci.org/boot/id/5c8052c159b5146b7bfe6018
>   Plain log:  https://storage.kernelci.org//mainline/master/v5.0-4854-g8dcd175bc3d5/arm/exynos_defconfig/gcc-7/lab-collabora/boot-exynos5422-odroidxu3.txt
>   HTML log:   https://storage.kernelci.org//mainline/master/v5.0-4854-g8dcd175bc3d5/arm/exynos_defconfig/gcc-7/lab-collabora/boot-exynos5422-odroidxu3.html
>   Result:     0918f18c7179 crypto: s5p - add AES support for Exynos5433
>
> Checks:
>   revert:     PASS
>   verify:     PASS

Thanks bot!
It is already known and patch is waiting to be applied:
https://patchwork.kernel.org/patch/10835389/

Best regards,
Krzysztof
