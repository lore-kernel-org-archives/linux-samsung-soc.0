From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Sun, 28 Apr 2013 22:24:54 +0900
Message-ID: <CAAQKjZOfLaiqKN+19Uw14cBREVN-kbaAyYyJJGg9jjTMjCk0Zw@mail.gmail.com>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com>
 <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com>
 <517A4D82.8010306@samsung.com> <4121004.exzbXa8F0p@flatron>
 <517ADCDB.3040101@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2111019755266214972=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <517ADCDB.3040101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2111019755266214972==
Content-Type: multipart/alternative; boundary=001a11c28e569b49ed04db6bb1b4

--001a11c28e569b49ed04db6bb1b4
Content-Type: text/plain; charset=ISO-8859-1

2013/4/27 Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> On 04/26/2013 09:42 PM, Tomasz Figa wrote:
>
>> On Friday 26 of April 2013 11:48:50 Sylwester Nawrocki wrote:
>>
>>> On 04/26/2013 10:20 AM, Inki Dae wrote:
>>>
>>>> Exactly right. it's my mistake. But now it seems that
>>>> __mode_of_device_table is multi defined at fimd and g2d side so there
>>>> still is module build error. :(
>>>>
>>> Since all drivers seem to be linked into single a single module, you
>>> likely need to create a separate table of struct of_device_id just for
>>> the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain
>>> 'compatible' strings for all devices. Or choose of_device_id for just
>>> one device and define MODULE_DEVICE_TABLE() for it in some common place,
>>> e.g. exynos_drm_drv.c. I believe all devices should be listed though.
>>>
>>
>> IMHO, the most proper solution would be to split the module into parent
>> exynos_drm module and per-device submodules, which would depend on the
>> parent module.
>>
>> This way you would be able to load dynamically any submodule you want,
>> without recompiling the modules.
>>
>
> Yes, this is how it would have been in a perfect world. Probably something
> worth to consider for the future, it likely implies a lot of work.
>
>
For now, exynos drm framework has a problem to module support with device
tree. And for this, going back to previous style might be a right way but
this also still has the probing issue. Frankly spreaking, I don't really
want back to previous style because that way not only still has a probing
issue but also makes exynos drm framework so complicated(there are many
things to consider every time framework updating). So I'd like to resolve
this issue as is first.


>

OTOH if there is one device for which the driver will always be present
> in the main module it should be enough to make a single entry
> MODULE_DEVICE_TABLE including its compatible string to ensure the driver
> is properly loaded, shouldn't it ?
>
>

--
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/**majordomo-info.html<http://vger.kernel.org/majordomo-info.html>
>

--001a11c28e569b49ed04db6bb1b4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">2013/4/27 Sylwester Nawrocki <span dir=3D"ltr">&lt;<a href=3D"mailto:sy=
lvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org<=
/a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On 04/26/2013 09:42 PM, Tomasz Figa wrot=
e:<br>

<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
On Friday 26 of April 2013 11:48:50 Sylwester Nawrocki wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
On 04/26/2013 10:20 AM, Inki Dae wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
Exactly right. it&#39;s my mistake. But now it seems that<br>
__mode_of_device_table is multi defined at fimd and g2d side so there<br>
still is module build error. :(<br>
</blockquote>
Since all drivers seem to be linked into single a single module, you<br>
likely need to create a separate table of struct of_device_id just for<br>
the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain<br>
&#39;compatible&#39; strings for all devices. Or choose of_device_id for ju=
st<br>
one device and define MODULE_DEVICE_TABLE() for it in some common place,<br=
>
e.g. exynos_drm_drv.c. I believe all devices should be listed though.<br>
</blockquote>
<br>
IMHO, the most proper solution would be to split the module into parent<br>
exynos_drm module and per-device submodules, which would depend on the<br>
parent module.<br>
<br>
This way you would be able to load dynamically any submodule you want,<br>
without recompiling the modules.<br>
</blockquote>
<br></div>
Yes, this is how it would have been in a perfect world. Probably something<=
br>
worth to consider for the future, it likely implies a lot of work.<br>
<br></blockquote><div>=A0</div><div><div>For now, exynos drm framework has =
a problem to module support with device tree. And  for this, going back to =
previous style might be a right way but this also still has the probing iss=
ue. Frankly spreaking, I don&#39;t really want back to previous style becau=
se that way not only still has a probing issue but also makes exynos drm fr=
amework so complicated(there are many things=A0to consider every time=A0fra=
mework=A0updating). So I&#39;d like to resolve this issue as is first.=A0</=
div>
</div><div>=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-l=
eft:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-lef=
t-style:solid" class=3D"gmail_quote">=A0</blockquote><blockquote style=3D"m=
argin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204)=
;border-left-width:1px;border-left-style:solid" class=3D"gmail_quote">

OTOH if there is one device for which the driver will always be present<br>
in the main module it should be enough to make a single entry<br>
MODULE_DEVICE_TABLE including its compatible string to ensure the driver<br=
>
is properly loaded, shouldn&#39;t it ?<br>
<br>=A0</blockquote><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-l=
eft:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-lef=
t-style:solid" class=3D"gmail_quote">
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" targe=
t=3D"_blank">majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/<u></u>majordomo-info.html</=
a><br>
</blockquote></div><br></div></div>

--001a11c28e569b49ed04db6bb1b4--

--===============2111019755266214972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2111019755266214972==--
