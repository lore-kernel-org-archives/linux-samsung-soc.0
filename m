From: Inki Dae <inki.dae@samsung.com>
Subject: Re: DMA mapping API abuse in exynos-drm
Date: Mon, 6 May 2013 14:59:14 +0900
Message-ID: <CAAQKjZONxDcHzKD3V+sJcM1+mSwqKg+y0Ak9g0ip0P4H937P6Q@mail.gmail.com>
References: <2146981.l1bUpBI0CH@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1757158075=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <2146981.l1bUpBI0CH@flatron>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1757158075==
Content-Type: multipart/alternative; boundary=047d7bf0c5be7e1c8504dc0666d5

--047d7bf0c5be7e1c8504dc0666d5
Content-Type: text/plain; charset=ISO-8859-1

2013/5/5 Tomasz Figa <tomasz.figa@gmail.com>

> Hi,
>
> Recently I've been working a bit on a DRM driver for the GPU of Samsung
> S3C6410 SoCs, which required me to familiarize a bit with exynos-drm, as
> it already contains a KMS driver which is compatible with the SoC I'm
> working with, making it a good place to put my driver in.
>
> Reading through exynos_drm_buf.c I stumbled across following (a bit long)
> piece of code:
>
>         dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &buf->dma_attrs);
>
>         nr_pages = buf->size >> PAGE_SHIFT;
>
>         if (!is_drm_iommu_supported(dev)) {
>                 dma_addr_t start_addr;
>                 unsigned int i = 0;
>
>                 buf->pages = kzalloc(sizeof(struct page) * nr_pages,
>                                         GFP_KERNEL);
>                 if (!buf->pages) {
>                         DRM_ERROR("failed to allocate pages.\n");
>                         return -ENOMEM;
>                 }
>
>                 buf->kvaddr = dma_alloc_attrs(dev->dev, buf->size,
>                                         &buf->dma_addr, GFP_KERNEL,
>                                         &buf->dma_attrs);
>                 if (!buf->kvaddr) {
>                         DRM_ERROR("failed to allocate buffer.\n");
>                         kfree(buf->pages);
>                         return -ENOMEM;
>                 }
>
>                 start_addr = buf->dma_addr;
>                 while (i < nr_pages) {
>                         buf->pages[i] = phys_to_page(start_addr);
>                         start_addr += PAGE_SIZE;
>                         i++;
>                 }
>         } else {
>
>                 buf->pages = dma_alloc_attrs(dev->dev, buf->size,
>                                         &buf->dma_addr, GFP_KERNEL,
>                                         &buf->dma_attrs);
>                 if (!buf->pages) {
>                         DRM_ERROR("failed to allocate buffer.\n");
>                         return -ENOMEM;
>                 }
>         }
>
>         buf->sgt = drm_prime_pages_to_sg(buf->pages, nr_pages);
>         if (!buf->sgt) {
>                 DRM_ERROR("failed to get sg table.\n");
>                 ret = -ENOMEM;
>                 goto err_free_attrs;
>         }
>
> Notice that the value returned by dma_alloc_attrs() is assumed by this
> code to be either a kernel virtual address (in !is_drm_iommu_supported()
> case) or struct pages ** (in is_drm_iommu_supported() case), which seemed
> a bit worrying to me, making me do a more in depth research on how
> dma_alloc_attrs works.
>
> This, in turn, led me to following excerpt of Documentation/DMA-
> attributes.txt :
>
> DMA_ATTR_NO_KERNEL_MAPPING
> --------------------------
>
> DMA_ATTR_NO_KERNEL_MAPPING lets the platform to avoid creating a kernel
> virtual mapping for the allocated buffer. On some architectures creating
> such mapping is non-trivial task and consumes very limited resources
> (like kernel virtual address space or dma consistent address space).
> Buffers allocated with this attribute can be only passed to user space
> by calling dma_mmap_attrs(). By using this API, you are guaranteeing
> that you won't dereference the pointer returned by dma_alloc_attr(). You
> can threat it as a cookie that must be passed to dma_mmap_attrs() and
> dma_free_attrs(). Make sure that both of these also get this attribute
> set on each call.
>
> of which the following sentence is the most relevant:
>
> By using this API, you are guaranteeing that you won't dereference the
> pointer returned by dma_alloc_attr().
>
> This statement is obviously ignored by buffer allocation code of exynos-
> drm.
>
> A simple git blame revealed that this brokenness has been introduced by
> commit:
>
> 4744ad2 drm/exynos: use DMA_ATTR_NO_KERNEL_MAPPING attribute
>
>
> and later fixed a bit by following depending patches (because the original
> patch apparently broke any allocations without IOMMU):
>
> c704f1b drm/exynos: consider no iommu support to console framebuffer
> 694be45 drm/exynos: consider buffer allocation without iommu
>
>
> Now, the real question is whether my reasoning is incorrect (sorry for the
> noise then) or this is really a bug which needs to be fixed?
>
>
Hi Tomasz,

Your question is reasonable to me. And below is my opinion,

First, also the below attribute says like below,

DMA_ATTR_NO_KERNEL_MAPPING
--------------------------
...
Since it is optional for platforms to implement
DMA_ATTR_NO_KERNEL_MAPPING, those that do not will simply ignore the
attribute and exhibit default behavior.


In case of ARM SoC, it seems like that it just ignores the attribute
without iommu: in case of no iommu, dma_alloc_attr() always maps pages
allocated from highmem with kernel space. So I think we make sure that
exynos drm driver sets the attribute only with iommu to avoid such
confusing. For this, will post it soon.

Thanks,
Inki Dae

Best regards,
> Tomasz
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--047d7bf0c5be7e1c8504dc0666d5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/5/5 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:tomasz=
.figa@gmail.com" target=3D"_blank">tomasz.figa@gmail.com</a>&gt;</span><br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Hi,<br>
<br>
Recently I&#39;ve been working a bit on a DRM driver for the GPU of Samsung=
<br>
S3C6410 SoCs, which required me to familiarize a bit with exynos-drm, as<br=
>
it already contains a KMS driver which is compatible with the SoC I&#39;m<b=
r>
working with, making it a good place to put my driver in.<br>
<br>
Reading through exynos_drm_buf.c I stumbled across following (a bit long)<b=
r>
piece of code:<br>
<br>
=A0 =A0 =A0 =A0 dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &amp;buf-&gt;dma_a=
ttrs);<br>
<br>
=A0 =A0 =A0 =A0 nr_pages =3D buf-&gt;size &gt;&gt; PAGE_SHIFT;<br>
<br>
=A0 =A0 =A0 =A0 if (!is_drm_iommu_supported(dev)) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_addr_t start_addr;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int i =3D 0;<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf-&gt;pages =3D kzalloc(sizeof(struct pag=
e) * nr_pages,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 GFP_KERNEL);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!buf-&gt;pages) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to a=
llocate pages.\n&quot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf-&gt;kvaddr =3D dma_alloc_attrs(dev-&gt;=
dev, buf-&gt;size,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &amp;buf-&gt;dma_addr, GFP_KERNEL,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &amp;buf-&gt;dma_attrs);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!buf-&gt;kvaddr) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to a=
llocate buffer.\n&quot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(buf-&gt;pages);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 start_addr =3D buf-&gt;dma_addr;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (i &lt; nr_pages) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf-&gt;pages[i] =3D phys_t=
o_page(start_addr);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 start_addr +=3D PAGE_SIZE;<=
br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
=A0 =A0 =A0 =A0 } else {<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf-&gt;pages =3D dma_alloc_attrs(dev-&gt;d=
ev, buf-&gt;size,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &amp;buf-&gt;dma_addr, GFP_KERNEL,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &amp;buf-&gt;dma_attrs);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!buf-&gt;pages) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to a=
llocate buffer.\n&quot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
=A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 buf-&gt;sgt =3D drm_prime_pages_to_sg(buf-&gt;pages, nr_pag=
es);<br>
=A0 =A0 =A0 =A0 if (!buf-&gt;sgt) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to get sg table.\n&q=
uot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free_attrs;<br>
=A0 =A0 =A0 =A0 }<br>
<br>
Notice that the value returned by dma_alloc_attrs() is assumed by this<br>
code to be either a kernel virtual address (in !is_drm_iommu_supported()<br=
>
case) or struct pages ** (in is_drm_iommu_supported() case), which seemed<b=
r>
a bit worrying to me, making me do a more in depth research on how<br>
dma_alloc_attrs works.<br>
<br>
This, in turn, led me to following excerpt of Documentation/DMA-<br>
attributes.txt :<br>
<br>
DMA_ATTR_NO_KERNEL_MAPPING<br>
--------------------------<br>
<br>
DMA_ATTR_NO_KERNEL_MAPPING lets the platform to avoid creating a kernel<br>
virtual mapping for the allocated buffer. On some architectures creating<br=
>
such mapping is non-trivial task and consumes very limited resources<br>
(like kernel virtual address space or dma consistent address space).<br>
Buffers allocated with this attribute can be only passed to user space<br>
by calling dma_mmap_attrs(). By using this API, you are guaranteeing<br>
that you won&#39;t dereference the pointer returned by dma_alloc_attr(). Yo=
u<br>
can threat it as a cookie that must be passed to dma_mmap_attrs() and<br>
dma_free_attrs(). Make sure that both of these also get this attribute<br>
set on each call.<br>
<br>
of which the following sentence is the most relevant:<br>
<br>
By using this API, you are guaranteeing that you won&#39;t dereference the<=
br>
pointer returned by dma_alloc_attr().<br>
<br>
This statement is obviously ignored by buffer allocation code of exynos-<br=
>
drm.<br>
<br>
A simple git blame revealed that this brokenness has been introduced by<br>
commit:<br>
<br>
4744ad2 drm/exynos: use DMA_ATTR_NO_KERNEL_MAPPING attribute<br>
<br>
<br>
and later fixed a bit by following depending patches (because the original<=
br>
patch apparently broke any allocations without IOMMU):<br>
<br>
c704f1b drm/exynos: consider no iommu support to console framebuffer<br>
694be45 drm/exynos: consider buffer allocation without iommu<br>
<br>
<br>
Now, the real question is whether my reasoning is incorrect (sorry for the<=
br>
noise then) or this is really a bug which needs to be fixed?<br>
<br></blockquote><div><br></div><div>Hi Tomasz,<br><br>Your question is rea=
sonable to me. And below is my opinion,<br><br>First, also the below attrib=
ute says like below,<br><br>DMA_ATTR_NO_KERNEL_MAPPING<br>-----------------=
---------<br>
...<br>Since it is optional for platforms to implement<br>DMA_ATTR_NO_KERNE=
L_MAPPING, those that do not will simply ignore the<br>attribute and exhibi=
t default behavior.<br><br></div><div><br></div><div>In case of ARM SoC, it=
 seems like that it just ignores the attribute without iommu: in case of no=
 iommu, dma_alloc_attr() always maps pages allocated from highmem with kern=
el space. So I think we make sure that exynos drm driver sets the attribute=
 only with iommu to avoid such confusing. For this, will post it soon.<br>
</div><div>=A0<br></div><div>Thanks,<br>Inki Dae<br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Tomasz<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</blockquote></div><br></div></div>

--047d7bf0c5be7e1c8504dc0666d5--

--===============1757158075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1757158075==--
