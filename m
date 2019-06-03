From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [BUG BISECT] bug mm/vmalloc.c:470 (mm/vmalloc.c: get rid of one
 single unlink_va() when merge)
Date: Mon, 3 Jun 2019 16:10:40 +0200
Message-ID: <CAJKOXPdczUnsaBeXTuutZXCQ70ejDT68xnVm-e+SSdLZi-vyCA@mail.gmail.com>
References: <CAJKOXPcTVpLtSSs=Q0G3fQgXYoVa=kHxWcWXyvS13ie73ByZBw@mail.gmail.com>
 <20190603135939.e2mb7vkxp64qairr@pc636>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603135939.e2mb7vkxp64qairr@pc636>
Sender: linux-kernel-owner@vger.kernel.org
To: Uladzislau Rezki <urezki@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Andrei Vagin <avagin@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 3 Jun 2019 at 15:59, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> Hello, Krzysztof.
>
> On Mon, Jun 03, 2019 at 11:07:46AM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > On recent next I see bugs during boot (after bringing up user-space or
> > during reboot):
> > kernel BUG at ../mm/vmalloc.c:470!
> > On all my boards. On QEMU I see something similar, although the
> > message is "Internal error: Oops - undefined instruction: 0 [#1] ARM",

Indeed it looks like effect of merge conflict resolution or applying.
When I look at MMOTS, it is the same as yours:
http://git.cmpxchg.org/cgit.cgi/linux-mmots.git/commit/?id=b77b8cce67f246109f9d87417a32cd38f0398f2f

However in linux-next it is different.

Stephen, any thoughts?

Best regards,
Krzysztof

> >
> > The calltrace is:
> > [   34.565126] [<c0275c9c>] (__free_vmap_area) from [<c0276044>]
> > (__purge_vmap_area_lazy+0xd0/0x170)
> > [   34.573963] [<c0276044>] (__purge_vmap_area_lazy) from [<c0276d50>]
> > (_vm_unmap_aliases+0x1fc/0x244)
> > [   34.582974] [<c0276d50>] (_vm_unmap_aliases) from [<c0279500>]
> > (__vunmap+0x170/0x200)
> > [   34.590770] [<c0279500>] (__vunmap) from [<c01d5a70>]
> > (do_free_init+0x40/0x5c)
> > [   34.597955] [<c01d5a70>] (do_free_init) from [<c01478f4>]
> > (process_one_work+0x228/0x810)
> > [   34.606018] [<c01478f4>] (process_one_work) from [<c0147f0c>]
> > (worker_thread+0x30/0x570)
> > [   34.614077] [<c0147f0c>] (worker_thread) from [<c014e8b4>]
> > (kthread+0x134/0x164)
> > [   34.621438] [<c014e8b4>] (kthread) from [<c01010b4>]
> > (ret_from_fork+0x14/0x20)
> >
> > Full log here:
> > https://krzk.eu/#/builders/1/builds/3356/steps/14/logs/serial0
> > https://krzk.eu/#/builders/22/builds/1118/steps/35/logs/serial0
> >
> > Bisect pointed to:
> > 728e0fbf263e3ed359c10cb13623390564102881 is the first bad commit
> > commit 728e0fbf263e3ed359c10cb13623390564102881
> > Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > Date:   Sat Jun 1 12:20:19 2019 +1000
> >     mm/vmalloc.c: get rid of one single unlink_va() when merge
> >
> I have checked the linux-next. I can confirm it happens because of:
>  mm/vmalloc.c: get rid of one single unlink_va() when merge
>
> The problem is that, it has been applied wrongly into linux-next tree
> for some reason, i do not why. Probably due to the fact that i based
> my work on 5.1/2-rcX, whereas linux-next is a bit ahead of it. If so,
> sorry for that.
>
> See below the clean patch for remotes/linux-next/master:
>
> <snip>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 650c89f38c1e..0ed95b864e31 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -719,9 +719,6 @@ merge_or_add_vmap_area(struct vmap_area *va,
>                         /* Check and update the tree if needed. */
>                         augment_tree_propagate_from(sibling);
>
> -                       /* Remove this VA, it has been merged. */
> -                       unlink_va(va, root);
> -
>                         /* Free vmap_area object. */
>                         kmem_cache_free(vmap_area_cachep, va);
>
> @@ -746,12 +743,11 @@ merge_or_add_vmap_area(struct vmap_area *va,
>                         /* Check and update the tree if needed. */
>                         augment_tree_propagate_from(sibling);
>
> -                       /* Remove this VA, it has been merged. */
> -                       unlink_va(va, root);
> +                       if (merged)
> +                               unlink_va(va, root);
>
>                         /* Free vmap_area object. */
>                         kmem_cache_free(vmap_area_cachep, va);
> -
>                         return;
>                 }
>         }
> --
> 2.11.0
> <snip>
>
> Andrew, i am not sure how to proceed with that. Should i send an updated series
> based on linux-next tip or you can fix directly that patch?
>
> Thank you!
>
> --
> Vlad Rezki
