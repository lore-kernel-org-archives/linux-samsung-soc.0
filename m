From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 31 Jan 2017 14:54:53 -0800
Message-ID: <87d1f2kfgi.fsf@eliezer.anholt.net>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay> <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net> <20170131213132.GC872@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0858028808=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131213132.GC872@mithrandir.ba.sec>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0858028808==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thierry Reding <thierry.reding@gmail.com> writes:

> [ Unknown signature status ]
> On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
>> Thierry Reding <thierry.reding@gmail.com> writes:
>>=20
>> > [ Unknown signature status ]
>> > On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
>> >> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
>> >> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
>> >> > >=20
>> >> > >=20
>> >> > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> >> > > > Dear Thierry,
>> >> > > >=20
>> >> > > > Could you please review this patch?
>> >> > >=20
>> >> > > Thierry, I think this patch has been reviewed enough but no comme=
nt
>> >> > > from you. Seems you are busy. I will pick up this.
>> >> >=20
>> >> > Sorry, but that's not how it works. This patch has gone through 8
>> >> > revisions within 4 weeks, and I tend to ignore patches like that un=
til
>> >> > the dust settles.
>> >> >=20
>> >>=20
>> >> Seems like the dust was pretty settled. It was posted on 1/11, pinged=
 on 1/24,
>> >> and picked up on 1/31. I don't think it's unreasonable to take it thr=
ough
>> >> another tree after that.
>> >>=20
>> >> I wonder if drm_panel would benefit from the -misc group maintainersh=
ip model
>> >> as drm_bridge does. By spreading out the workload, the high-maintenan=
ce
>> >> patches would hopefully find someone to shepherd them through.
>> >
>> > Except that nobody except me really cares. If we let people take patch=
es
>> > through separate trees or group-maintained trees they'll likely go in
>> > without too much thought. DRM panel is somewhat different from core DRM
>> > in this regard because its infrastructure is minimal and there's little
>> > outside the panel-simple driver. So we're still at a stage where we ne=
ed
>> > to fine-tune what drivers should look like and how we can improve.
>>=20
>> I would love to care and participate in review, but with the structure
>> of your tree you're the only one whose review counts, so I don't
>> participate.
>
> Really? What exactly do you think is special about the structure of my
> tree? I require patches to be on dri-devel (I pick them up from the
> patchwork instance at freedesktop.org), the tree is publicly available
> and reviewed-by tags get picked up automatically by patchwork.
>
> The panel tree works exactly like any other maintainer tree. And my
> review is *not* the only one that counts. I appreciate every Reviewed-by
> tag I see on panel patches because it means that I don't have to look as
> closely as I have to otherwise.
>
> It is true that I am responsible for those patches, that's why I get to
> have the final word on whether or not a patch gets applied. And that's
> no different from any other maintainer tree either.

If me reviewing a patch isn't part of unblocking that patch getting in,
then I won't bother because all I could end up doing is punishing the
developer of the patch.  Contributors have a hard enough time already.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliRFb0ACgkQtdYpNtH8
nuiP1hAAuoWkYiJW8f7XTNzO+DloPyrsfTKZ9fXUWl/Oq9dejAelYsSG5udR+Wmk
lHYsTb0dyWuQlck0zT5MA7SQoaGUiJJ3otrR7qcWjryc2Pgq7l0qlOrvQlCkKNIW
kjO+v/p52Hfp0rm6VUOGhJhVupzyTV6pNh+9IGjxzECfV4QEftq0twTSHa1cqXK/
QoQG7tjqA/2pnVr0KQTcBXGeSlP36MoXKM+4d+5lO3Q7LLU/mxbgvSFpqW9+Ifeu
Zk/DsCoj7tB3pj6/qlLT4bxvajPeQ7Iznw88CdhNzLmhG4ms5ZWCA23JupSf5IA6
RgT2cLQDqYyvu/WspKiZEVtcnSf/MSXPMvnc8krYOxEnwdO0Br1dpmzM3I/BsjQP
GadRyztd3I8yQzIQ3sQsUDTjpLVA4gISUt3SVStTysqfbccXwMjMOdcdq5nQ3+Yo
iUva/C5+p8t4hlSjp9vGH8JdhwvR5IYpOQVOBPuh3vy7vPZhf1hk/dcAsZIJ/nGm
5yPMMgBTXsCr8KhdY/wBMRx+dWLYs7VmDQoHVzwtg74K6eA5Uf2EaI55mfIaThWz
ZfTU700WRvBmAHhfU58wwPKcw2RXVBWnuBdaHFq5I54+1ub2351iu7mEGK1YZJ/o
VZE/5PZv4tuTKAdSo66reb9E1cabzR+4OoKeBEW7sfYI3vngNwE=
=H/ra
-----END PGP SIGNATURE-----
--=-=-=--

--===============0858028808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0858028808==--
