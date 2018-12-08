From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 0/3] iio: adc: exynos-adc: Add support for S5PV210
Date: Sat, 8 Dec 2018 15:59:53 +0000
Message-ID: <20181208155953.6e31ba04@archlinux>
References: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, kgene@kernel.org, krzk@kernel.org, xc-racer2@live.ca, broonie@kernel.org, arnaud.pouliquen@st.com, baolin.wang@linaro.org, smohanad@codeaurora.org, eugen.hristev@microchip.com, rdunlap@infradead.org, vilhelm.gray@gmail.com, freeman.liu@spreadtrum.com, marcus.folkesson@gmail.com, geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri,  7 Dec 2018 20:11:33 +0100
Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote:

> This patchset adds support for S5PV210 adc variant to exynos-adc driver.

This looks fine to me, but I'd like to let it sit on the lists
for a few days to let people more familiar with the platform have
time to review.

Give me a poke if I seem to have forgotten it in a week or so.

Thanks,

Jonathan

>=20
> Jonathan Bakker (3):
>   iio: adc: exynos-adc: Add S5PV210 variant
>   iio: adc: Allow selection of Exynos ADC on S5PV210
>   dt-bindings: iio: adc: exynos-adc: Add S5PV210 variant
>=20
>  .../bindings/iio/adc/samsung,exynos-adc.txt        |  4 +++-
>  drivers/iio/adc/Kconfig                            |  2 +-
>  drivers/iio/adc/exynos_adc.c                       | 14 ++++++++++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>=20
