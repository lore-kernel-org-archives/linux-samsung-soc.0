From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/pl111: add ARM_AMBA dependency
Date: Mon, 22 May 2017 15:08:52 -0700
Message-ID: <87pof07de3.fsf@eliezer.anholt.net>
References: <20170522152058.3346428-1-arnd@arndb.de> <878tlolv1z.fsf@eliezer.anholt.net> <CAK8P3a3UjWM0OGVO1nNyEtrRUyFKDuBOboYVSnVLcg4MTKfFMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:53250 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934403AbdEVWIz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 May 2017 18:08:55 -0400
In-Reply-To: <CAK8P3a3UjWM0OGVO1nNyEtrRUyFKDuBOboYVSnVLcg4MTKfFMQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Colin Ian King <colin.king@canonical.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain

Arnd Bergmann <arnd@arndb.de> writes:

> On Mon, May 22, 2017 at 6:23 PM, Eric Anholt <eric@anholt.net> wrote:
>> Arnd Bergmann <arnd@arndb.de> writes:
>>
>>> The driver is written in a way to enable compile-testing without CONFIG_ARM_AMBA,
>>> but it just causes needless warnings:
>>>
>>> drivers/gpu/drm/pl111/pl111_drv.c:149:26: error: 'pl111_drm_driver' defined but not used [-Werror=unused-variable]
>>> drivers/gpu/drm/pl111/pl111_drv.c:81:12: error: 'pl111_modeset_init' defined but not used [-Werror=unused-function]
>>>
>>> This removes the #ifdef instead, and adds a dependency on ARM_AMBA to
>>> only let us build the driver when the base support is enabled.
>>>
>>> Unfortunately, this requires removing one redundant 'select ARM_AMBA'
>>> line from mach-s3c64xx to avoid a circular dependency.
>>>
>>> It might be good to allow manually enabling ARM_AMBA when COMPILE_TEST
>>> is turned on, but that should be a separate patch and may cause other
>>> build regressions.
>>
>> If I understand the Kconfig, you're effectively disabling the build on
>> COMPILE_TEST && !ARM.  I'd rather that we just fix up the warnings, so
>> that people can keep build-testing DRM drivers:
>>
>> https://patchwork.kernel.org/patch/9737857/
>
> That works too. When I tried the same, I thought it was a little too silly to
> have a file that effectively compiles into nothing.
>
> My initial approach did two things differently though:
>
> - use __maybe_unused instead of __used, since
>
> - annotate pl111_amba_driver instead of
>   pl111_drm_driver/pl111_modeset_init, and keep only
>   module_amba_driver() in the #ifdef.

Oh, yeah, we've eliminated the amba_request_regions() that used to be
why the probe had to be under the #ifdef, so your solution would get us
better coverage and simpler code.  If you could send that patch to
dri-devel today, I'll get it applied.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkjYXQACgkQtdYpNtH8
nuiA0Q//ZZ4KhoC21Nfn+WQO+kqkDNj2fccGQ+zCWyNsKxk0StzxesGH3+hzNRrq
uBoiRG7Fq/tCQxyUEGPPJhTYe70FfvHFL1B5OS39vHUp0xNaZffdJ3uy4Ff2QuB4
X2AlToZzZGBC/UG07ZgR4B8GMJeGZ5WHRnfpMLoxXLbase4Tvzm6F+mNpelUL/tB
qZsNOgwq81iT9P9EEyGgvQ8QrBI6+NKfInj7cjHAH0pWHrqBBiGhGNHXjJlaw9Us
WqTUYxSOKYe5GlFPlEPXc2MK1wiDxwQ72JT8s7FF1brWL8jB8Y0d+2JOFsHVEoDy
RNLVrXtO7VYNzHvzgT4hI97fMupp2lEYS+Yxj0w4j+t9HIqefTeeSGZCgZ1fEVr7
wmnJgrrKP9NK0tpj9MqNHXl+WPi23UHxK67tx3k8O2GioGYqR6LBd8rtz86bdI0s
4uSEVAaDrikuyKj2VmbHTghk8cQQx0mg8U8LgsYQGjNhsswMhzQp9Zv9ebvJkM4H
ouYQZfofGdMKZ2Rt4JaKFgIbCcwyGdTdM9mh89Io9PcPzvDLJav1gDuCRCzLFhCe
tgl2ckRMJPTJY7pU+6nwy8EbSTes30p+KxcuszCvZlYyuwu2LAnRSw9dV8RcDBej
fjIk9wbGq/86V3fGj3ljohAunWWKHoCwilKtgbmk/IJez0nUCB4=
=5JRA
-----END PGP SIGNATURE-----
--=-=-=--
