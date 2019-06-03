From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUG BISECT] bug mm/vmalloc.c:470 (mm/vmalloc.c: get rid of one
 single unlink_va() when merge)
Date: Tue, 4 Jun 2019 00:40:00 +1000
Message-ID: <20190604004000.0d6356a9@canb.auug.org.au>
References: <CAJKOXPcTVpLtSSs=Q0G3fQgXYoVa=kHxWcWXyvS13ie73ByZBw@mail.gmail.com>
        <20190603135939.e2mb7vkxp64qairr@pc636>
        <CAJKOXPdczUnsaBeXTuutZXCQ70ejDT68xnVm-e+SSdLZi-vyCA@mail.gmail.com>
        <20190604003153.76f33dd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Hhpt4L1s=8zO1hfZdUUFFal"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604003153.76f33dd2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Andrei Vagin <avagin@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

--Sig_/Hhpt4L1s=8zO1hfZdUUFFal
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Jun 2019 00:31:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi Krzysztof,
>=20
> On Mon, 3 Jun 2019 16:10:40 +0200 Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> >
> > Indeed it looks like effect of merge conflict resolution or applying.
> > When I look at MMOTS, it is the same as yours:
> > http://git.cmpxchg.org/cgit.cgi/linux-mmots.git/commit/?id=3Db77b8cce67=
f246109f9d87417a32cd38f0398f2f
> >=20
> > However in linux-next it is different.
> >=20
> > Stephen, any thoughts? =20
>=20
> Have you had a look at today's linux-next?  It looks correct in
> there.  Andrew updated his patch series over the weekend.

Actually, this is the patch from mmotm (note 'm'):

From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: mm/vmalloc.c: get rid of one single unlink_va() when merge

It does not make sense to try to "unlink" the node that is definitely not
linked with a list nor tree.  On the first merge step VA just points to
the previously disconnected busy area.

On the second step, check if the node has been merged and do "unlink" if
so, because now it points to an object that must be linked.

Link: http://lkml.kernel.org/r/20190527151843.27416-4-urezki@gmail.com
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Acked-by: Hillf Danton <hdanton@sina.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Joel Fernandes <joelaf@google.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>
Cc: Roman Gushchin <guro@fb.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Thomas Garnier <thgarnie@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/vmalloc.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/mm/vmalloc.c~mm-vmap-get-rid-of-one-single-unlink_va-when-merge
+++ a/mm/vmalloc.c
@@ -719,8 +719,8 @@ merge_or_add_vmap_area(struct vmap_area
 			/* Check and update the tree if needed. */
 			augment_tree_propagate_from(sibling);
=20
-			/* Remove this VA, it has been merged. */
-			unlink_va(va, root);
+			if (merged)
+				unlink_va(va, root);
=20
 			/* Free vmap_area object. */
 			kmem_cache_free(vmap_area_cachep, va);
@@ -746,9 +746,6 @@ merge_or_add_vmap_area(struct vmap_area
 			/* Check and update the tree if needed. */
 			augment_tree_propagate_from(sibling);
=20
-			/* Remove this VA, it has been merged. */
-			unlink_va(va, root);
-
 			/* Free vmap_area object. */
 			kmem_cache_free(vmap_area_cachep, va);
=20
_

Do I need to replace that for tomorrow?
--=20
Cheers,
Stephen Rothwell

--Sig_/Hhpt4L1s=8zO1hfZdUUFFal
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1MUAACgkQAVBC80lX
0GyODwgAhFRY7MDp6PN5rHGvLRcgcl0R9opYG6WWuR5pAkl9A7RGR/6BDDLm0ZVu
YvumuExfm9Z4XFQkdAqX3yPw+Zt7Y1fLTyY7G8obyw4D+L5/DbktmCKqWMHMO4OZ
iVeW4LyAGfY+t/XFu2By/hPZuIUXnjL+zWP5hW3q+bI0Kzy028LnAEcISuuMxSY4
6ePXcA4eOZZgwAn60poxjWOIgpiu13CTjEsK9/FH/kDbF+bghqvKyI7q09DcBKkm
BSTTHiXPPXCxAjFve53BBQc418H2ZZ+j0uTWZBfsjRWpOETHafQYnZAXwVl7GHaF
L7E3xO/wVQbdCMyaKMbdh3Io4lmHZw==
=/lGE
-----END PGP SIGNATURE-----

--Sig_/Hhpt4L1s=8zO1hfZdUUFFal--
