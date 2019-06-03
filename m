From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUG BISECT] bug mm/vmalloc.c:470 (mm/vmalloc.c: get rid of one
 single unlink_va() when merge)
Date: Tue, 4 Jun 2019 00:31:53 +1000
Message-ID: <20190604003153.76f33dd2@canb.auug.org.au>
References: <CAJKOXPcTVpLtSSs=Q0G3fQgXYoVa=kHxWcWXyvS13ie73ByZBw@mail.gmail.com>
        <20190603135939.e2mb7vkxp64qairr@pc636>
        <CAJKOXPdczUnsaBeXTuutZXCQ70ejDT68xnVm-e+SSdLZi-vyCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/T8JB7vmA6.0wdOso2xn.yrp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdczUnsaBeXTuutZXCQ70ejDT68xnVm-e+SSdLZi-vyCA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Andrei Vagin <avagin@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

--Sig_/T8JB7vmA6.0wdOso2xn.yrp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, 3 Jun 2019 16:10:40 +0200 Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
>
> Indeed it looks like effect of merge conflict resolution or applying.
> When I look at MMOTS, it is the same as yours:
> http://git.cmpxchg.org/cgit.cgi/linux-mmots.git/commit/?id=3Db77b8cce67f2=
46109f9d87417a32cd38f0398f2f
>=20
> However in linux-next it is different.
>=20
> Stephen, any thoughts?

Have you had a look at today's linux-next?  It looks correct in
there.  Andrew updated his patch series over the weekend.

--=20
Cheers,
Stephen Rothwell

--Sig_/T8JB7vmA6.0wdOso2xn.yrp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1L1kACgkQAVBC80lX
0Gy6Nwf/eOmUW6/H8C+yiT3y7MfpDwgD9FP9IuOOQsC1eGfyZ//CGE7jojPjuwCp
827J8ZM8CaEvBsV9iELlKg+w1zy+RrNVDoNQE+l2z8O7MJYW9Tm9u95cdAsLqWwA
oZfzmqKp+5GJ/rYEXm/zRzT9rkR/NnKdUr5WumOp7gUlVhzjQ9KgFQPnhjrIB94Z
Ib+WdHZ9IgaisVD1pA8rWju5wTAq2SyKLKfAL35h18Lj6T0+QZiEx23Je8GiiWtR
30VF4LCZvtL95TjMz8vNDOIEU57lDRSXEGQcM17KHLVLpM3a1VmN6IKYyVTKd21m
0FAZGs8EWDEh4iitzOEbJD0KE6N0jA==
=59/d
-----END PGP SIGNATURE-----

--Sig_/T8JB7vmA6.0wdOso2xn.yrp--
