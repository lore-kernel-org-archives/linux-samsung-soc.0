From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: Add syscon property to the MIPI phy in exynos5420
Date: Sat, 16 May 2015 12:27:27 +0900
Message-ID: <5556B91F.20103@kernel.org>
References: <1431607240-14549-1-git-send-email-tomeu.vizoso@collabora.com> <CAJKOXPd7=wnjCd6Xz9ZNuvbxWi=cSr+eRj9YdPWA0PHR+AOTeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPd7=wnjCd6Xz9ZNuvbxWi=cSr+eRj9YdPWA0PHR+AOTeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/15/15 22:22, Krzysztof Kozlowski wrote:
> 2015-05-14 21:40 GMT+09:00 Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>:
>> Since e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression =
by
>> adding support for PMU regmap") the syscon property is required in
>> samsung,s5pv210-mipi-video-phy nodes, but this DTS hadn't been updat=
ed
>> yet.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8p/WX4DV1PbvA@public.gmane.org=
uk>
>> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Krzysztof Koz=C5=82owski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> --
>=20
> Triple-dash please, because this won't be cut by "git am".
>=20
> Everything else looks fine, thank you.
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20
Applied, thanks for you guys' effort.

- Kukjin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
