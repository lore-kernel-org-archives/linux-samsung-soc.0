From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 31 Jan 2017 10:15:10 -0800
Message-ID: <87r33j85ap.fsf@eliezer.anholt.net>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay> <20170131150226.GB4519@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1379450264=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131150226.GB4519@ulmo.ba.sec>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1379450264==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thierry Reding <thierry.reding@gmail.com> writes:

> [ Unknown signature status ]
> On Tue, Jan 31, 2017 at 09:38:53AM -0500, Sean Paul wrote:
>> On Tue, Jan 31, 2017 at 09:54:49AM +0100, Thierry Reding wrote:
>> > On Tue, Jan 31, 2017 at 09:01:07AM +0900, Inki Dae wrote:
>> > >=20
>> > >=20
>> > > 2017=EB=85=84 01=EC=9B=94 24=EC=9D=BC 10:50=EC=97=90 Hoegeun Kwon =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> > > > Dear Thierry,
>> > > >=20
>> > > > Could you please review this patch?
>> > >=20
>> > > Thierry, I think this patch has been reviewed enough but no comment
>> > > from you. Seems you are busy. I will pick up this.
>> >=20
>> > Sorry, but that's not how it works. This patch has gone through 8
>> > revisions within 4 weeks, and I tend to ignore patches like that until
>> > the dust settles.
>> >=20
>>=20
>> Seems like the dust was pretty settled. It was posted on 1/11, pinged on=
 1/24,
>> and picked up on 1/31. I don't think it's unreasonable to take it through
>> another tree after that.
>>=20
>> I wonder if drm_panel would benefit from the -misc group maintainership =
model
>> as drm_bridge does. By spreading out the workload, the high-maintenance
>> patches would hopefully find someone to shepherd them through.
>
> Except that nobody except me really cares. If we let people take patches
> through separate trees or group-maintained trees they'll likely go in
> without too much thought. DRM panel is somewhat different from core DRM
> in this regard because its infrastructure is minimal and there's little
> outside the panel-simple driver. So we're still at a stage where we need
> to fine-tune what drivers should look like and how we can improve.

I would love to care and participate in review, but with the structure
of your tree you're the only one whose review counts, so I don't
participate.

As is, I'm stuck out here with my panel driver I submitted on December
14th completely ignored, and no other developer will look at it because
their review doesn't count and only yours does.

I would love for drm-panel to be moved under -misc.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliQ1C8ACgkQtdYpNtH8
nuiNbA//f3VEpehrmIiZOQYiKOusFo/DeWl/Uw2/aUJeiezrzHzFtGaIQL+m4a+O
as4FNKIl7vwC87zw2V98xDVNNY/HlMrI914/PUZY7k31Ta5mSGpdHIkjRn377Apn
CND44YaCOnbyO1LcFiTfgNrCWP5yq+p+bPC8NPRlphLlxw+s/CjywwPVdanNS8F2
D+J+JstsYTP6C0cucU32n/ZBDbDTxNqySjTz2IttbfaVp+Y1Yq/fRGqA6sw8nN+C
79668VxzPCBP9AjnEQ2lVrlMtiRFP1xOgXo90xJ3lVGQdtrnJ1RW0lCSwAT2I2K0
KLaQb4wuKDlEzkkhDHCFtQXgHmqs4bJJWxlWcRho4L6/jPEHYO3vj4AZWVkkLVEs
nMiK4MDRVH9JGT5i66Nd6KlyQh6afCH6ul5ZkBc1CklW5gsxr2DvqZ37SHd5zW87
PuIG8nVZR4Xw6+aHiMSDZbZLQdXYCi9Xr9LwoFwlj82tJD17e8ncCpNkzSASCz0A
UWRlCu4r7DFvGNJSB6LgCm8pJX3ATnRP1PtgbQgFevlaZItP3dvvw1Hf2jkIQKLO
X+M4Cj5OnxypotkzVXkdowhHY9KTs1EBeCR/vbm2Q9LURihi/FGGl7C5j565L5NR
OJDjkDSV247RyOjXmdDyuHdWgDsNJW9hVEBgDUbJz/o0I5tXSXU=
=FkzR
-----END PGP SIGNATURE-----
--=-=-=--

--===============1379450264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1379450264==--
