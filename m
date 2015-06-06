From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH] Documentation: ARM: EXYNOS: Describe boot loaders interface
Date: Sat, 6 Jun 2015 20:43:45 +0900
Message-ID: <CAJKOXPefY1jCddwAL=uSg28St9rZbgxsLcDSmjmFfjYH-8EmGg@mail.gmail.com>
References: <1433585151-3627-1-git-send-email-k.kozlowski.k@gmail.com>
	<848ubx2j9v.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <848ubx2j9v.wl-peter.chubb@nicta.com.au>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, =?UTF-8?Q?=C5=81ukasz_Majewski?= <l.majewski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2015-06-06 20:01 GMT+09:00 Peter Chubb <peter.chubb@nicta.com.au>:
>>>>>> "Krzysztof" =3D=3D Krzysztof Kozlowski <k.kozlowski.k@gmail.com>=
 writes:
>
> Krzysztof> Various boot loaders for Exynos based boards use certain
> Krzysztof> memory addresses during booting for different
> Krzysztof> purposes. Mostly this is one of following : 1. as a CPU
> Krzysztof> boot address, 2. for storing magic cookie related to low
> Krzysztof> power mode (AFTR, sleep).
>
> Krzysztof> The document, based solely on kernel source code, tries to
> Krzysztof> group the information scattered over different files. This
> Krzysztof> would help in the future when adding support for new SoC o=
r
> Krzysztof> when extending features related to low power modes.
>
> Is it worth grabbing the info from u=3Dboot and documenting it here
> (it's not documented other than in the hardkenel U=3DBoot source)?
>
> I can send you the info, or you can see it in
> https://github.com/hardkernel/u-boot/blob/odroidxu3-v2012.07/board/sa=
msung/smdk5420/lowlevel_init.S
> at symbol nscode_base near line 104

Hi,

+CC =C5=81ukasz Majewski (u-boot)

The patch actually covers u-boot. What is missing:
1, Reset - I think kernel does not set it.
2. LPA - There is no mainline support for it yet so I did not add it.
It should be added along with cpuidle LPA.
3. MCPM and Exynos542x stuff. There are some exceptions and weird
comments in the kernel (like "To increase the stability of KFC reset
we need to program  the PMU SPARE3 register"). It would take me some
more time to understand it so I wanted to start with basic version and
get comments.

Best regards,
Krzysztof
