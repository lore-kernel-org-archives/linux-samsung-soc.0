From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Wed, 7 Nov 2012 15:06:35 +0530
Message-ID: <CAFp+6iGcRiq81TJ5=bHMEwnYS56Yc7F5jubGTzt=8pymqGnLPA@mail.gmail.com>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
 <20121106131453.GL11931@arwen.pp.htv.fi>
 <CAFp+6iH=hs-Rr5CkcCWXLMeFQ+Q=xYC6xtZ1tybz=yeFRUcUwg@mail.gmail.com>
 <20121106163920.GC3993@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3738637025722739261=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121106163920.GC3993-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
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
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kishon <kishon-l0cyMroinI0@public.gmane.org>, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============3738637025722739261==
Content-Type: multipart/alternative; boundary=e0cb4efe2f1459f05804cde474d0

--e0cb4efe2f1459f05804cde474d0
Content-Type: text/plain; charset=ISO-8859-1

Hi,


On Tue, Nov 6, 2012 at 10:09 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:

> Hi,
>
> On Tue, Nov 06, 2012 at 07:23:12PM +0530, Vivek Gautam wrote:
> > Hi Balbi,
> >
> >
> > On Tue, Nov 6, 2012 at 6:44 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > > Hi,
> > >
> > > On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:
> > >> This patchset is based on the work by Praveen Paneri for
> > >> samsung-usbphy driver:
> > >> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653
> > >>
> > >> Changes from v2:
> > >>  - Using "EXYNOS5_PHY_" as common prefix along with exact names for
> > >>    PHY SFRs for register definitions
> > >>  - Using register names with bit macros to make things more clear.
> > >>  - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
> > >>    in [patch 2/4 v2].
> > >>
> > >> Tested on smdk5250 target with usb-next branch along with arch patches
> > >> for exynos5250:
> > >> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
> > >> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048
> > >>
> > >> Vivek Gautam (4):
> > >>   usb: phy: samsung: Add host phy support to samsung-phy driver
> > >>   ARM: Exynos5250: Enabling samsung-usbphy driver
> > >>   USB: ehci-s5p: Add phy driver support
> > >>   USB: ohci-exynos: Add phy driver support
> > >
> > > I really don't know what to do with this series. I know it depends on
> > > the other PHY changes which I have in my queue, but it touches too much
> > > arch specific code, plus the USB Host code which I don't maintain.
> > >
> >
> > True, that it has dependency on the work by Praveen Paneri for
> samsung-usbphy
> > driver plus the arch support patches.
> >
> > This is based on usb-next branch, so the host-code can be taken care of ?
> >
> > > On top of all that, I have no platform to test these patches, which
> > > makes me even more worried about signing off under this series ;-)
> > >
> > The patches have however been tested. The two patches:
> > "USB: ehci-s5p: Add phy driver support",
> > "USB: ohci-exynos: Add phy driver support" have been acked by Jingoo Han
> > based on the patch-series.
> >
> > Possibly Kukjin Kim can help on this one.
> >
> > Kukjin,
> > Can we have a thought on this please.
> >
> > > Would it be ok if we delay this to v3.9 ? At least the dependency with
> > > other PHY changes would be dropped by then.
> > >
> > This changes are almost in shape ;-) and i am updating the next patchset
> soon.
> > If possible can we try to get this in 3.8 please. :-)
>
> we can try, but I'd like to minimize the amount of code outside of
> drivers/usb/ I take in my tree. If there's any way to split the series
> so it makes my life easier, I'd be really glad.
>

Thanks for this.
I have submitted v4 patch-set in this series:
http://www.spinics.net/lists/linux-usb/msg73977.html
This again contains some arch changes. I can minimize the arch support as
far as possible.
Possibly i can put up following changes further in v4.
 - Remove arch changes from [PATCH v4 1/5] ARM: EXYNOS: Update & move
usb-phy types to generic include layer

Small arch changes in [PATCH 2/5] usb: phy: samsung: Add host phy support
to samsung-phy driver,
in the same series (i missed v4 suffix in this :-( comes as a result of
Praveen Paneri's patches
in the series http://www.spinics.net/lists/linux-usb/msg73518.html, to
prevent build-break.

Kukjin can help Ack-ing with [PATCH v4 3/5] ARM: Exynos5250: Enabling
samsung-usbphy driver, since
this is machine specific patch.

Will this be fine ? Please suggest.


> Also, I can't apply arch/* patches without proper Acked-bys, so Kukjin
> would need to help us out there too :-)
>
> cheers
>
> --
> balbi
>



-- 
Thanks & Regards
Vivek

--e0cb4efe2f1459f05804cde474d0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue=
, Nov 6, 2012 at 10:09 PM, Felipe Balbi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:balbi-l0cyMroinI0@public.gmane.org" target=3D"_blank">balbi-l0cyMroinI0@public.gmane.org</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Hi,<br>
<div><div class=3D"h5"><br>
On Tue, Nov 06, 2012 at 07:23:12PM +0530, Vivek Gautam wrote:<br>
&gt; Hi Balbi,<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Nov 6, 2012 at 6:44 PM, Felipe Balbi &lt;<a href=3D"mailto:bal=
bi-l0cyMroinI0@public.gmane.org">balbi-l0cyMroinI0@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:<br>
&gt; &gt;&gt; This patchset is based on the work by Praveen Paneri for<br>
&gt; &gt;&gt; samsung-usbphy driver:<br>
&gt; &gt;&gt; <a href=3D"http://comments.gmane.org/gmane.linux.kernel.samsu=
ng-soc/12653" target=3D"_blank">http://comments.gmane.org/gmane.linux.kerne=
l.samsung-soc/12653</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Changes from v2:<br>
&gt; &gt;&gt; =A0- Using &quot;EXYNOS5_PHY_&quot; as common prefix along wi=
th exact names for<br>
&gt; &gt;&gt; =A0 =A0PHY SFRs for register definitions<br>
&gt; &gt;&gt; =A0- Using register names with bit macros to make things more=
 clear.<br>
&gt; &gt;&gt; =A0- Removed parentheses around 0x230 in definition for EXYNO=
S5_USB_CFG<br>
&gt; &gt;&gt; =A0 =A0in [patch 2/4 v2].<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Tested on smdk5250 target with usb-next branch along with arc=
h patches<br>
&gt; &gt;&gt; for exynos5250:<br>
&gt; &gt;&gt; <a href=3D"http://thread.gmane.org/gmane.linux.kernel.samsung=
-soc/13042" target=3D"_blank">http://thread.gmane.org/gmane.linux.kernel.sa=
msung-soc/13042</a><br>
&gt; &gt;&gt; <a href=3D"http://thread.gmane.org/gmane.linux.kernel.samsung=
-soc/13048" target=3D"_blank">http://thread.gmane.org/gmane.linux.kernel.sa=
msung-soc/13048</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Vivek Gautam (4):<br>
&gt; &gt;&gt; =A0 usb: phy: samsung: Add host phy support to samsung-phy dr=
iver<br>
&gt; &gt;&gt; =A0 ARM: Exynos5250: Enabling samsung-usbphy driver<br>
&gt; &gt;&gt; =A0 USB: ehci-s5p: Add phy driver support<br>
&gt; &gt;&gt; =A0 USB: ohci-exynos: Add phy driver support<br>
&gt; &gt;<br>
&gt; &gt; I really don&#39;t know what to do with this series. I know it de=
pends on<br>
&gt; &gt; the other PHY changes which I have in my queue, but it touches to=
o much<br>
&gt; &gt; arch specific code, plus the USB Host code which I don&#39;t main=
tain.<br>
&gt; &gt;<br>
&gt;<br>
&gt; True, that it has dependency on the work by Praveen Paneri for samsung=
-usbphy<br>
&gt; driver plus the arch support patches.<br>
&gt;<br>
&gt; This is based on usb-next branch, so the host-code can be taken care o=
f ?<br>
&gt;<br>
&gt; &gt; On top of all that, I have no platform to test these patches, whi=
ch<br>
&gt; &gt; makes me even more worried about signing off under this series ;-=
)<br>
&gt; &gt;<br>
&gt; The patches have however been tested. The two patches:<br>
&gt; &quot;USB: ehci-s5p: Add phy driver support&quot;,<br>
&gt; &quot;USB: ohci-exynos: Add phy driver support&quot; have been acked b=
y Jingoo Han<br>
&gt; based on the patch-series.<br>
&gt;<br>
&gt; Possibly Kukjin Kim can help on this one.<br>
&gt;<br>
&gt; Kukjin,<br>
&gt; Can we have a thought on this please.<br>
&gt;<br>
&gt; &gt; Would it be ok if we delay this to v3.9 ? At least the dependency=
 with<br>
&gt; &gt; other PHY changes would be dropped by then.<br>
&gt; &gt;<br>
&gt; This changes are almost in shape ;-) and i am updating the next patchs=
et soon.<br>
&gt; If possible can we try to get this in 3.8 please. :-)<br>
<br>
</div></div>we can try, but I&#39;d like to minimize the amount of code out=
side of<br>
drivers/usb/ I take in my tree. If there&#39;s any way to split the series<=
br>
so it makes my life easier, I&#39;d be really glad.<br></blockquote><br>Tha=
nks for this.<br>I have submitted v4 patch-set in this series: <a href=3D"h=
ttp://www.spinics.net/lists/linux-usb/msg73977.html">http://www.spinics.net=
/lists/linux-usb/msg73977.html</a><br>
This again contains some arch changes. I can minimize the arch support as f=
ar as possible.<br>Possibly i can put up following changes further in v4.<b=
r>=A0- Remove arch changes from [PATCH v4 1/5] ARM: EXYNOS: Update &amp; mo=
ve usb-phy types to generic include layer<br>
<br>Small arch changes in [PATCH 2/5] usb: phy: samsung: Add host phy suppo=
rt to samsung-phy driver,<br>in the same series (i missed v4 suffix in this=
 :-( comes as a result of Praveen Paneri&#39;s patches<br>in the series <a =
href=3D"http://www.spinics.net/lists/linux-usb/msg73518.html">http://www.sp=
inics.net/lists/linux-usb/msg73518.html</a>, to prevent build-break.<br>
<br>Kukjin can help Ack-ing with [PATCH v4 3/5] ARM: Exynos5250: Enabling s=
amsung-usbphy driver, since<br>this is machine specific patch.<br><br>Will =
this be fine ? Please suggest.<br><br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">

<br>
Also, I can&#39;t apply arch/* patches without proper Acked-bys, so Kukjin<=
br>
would need to help us out there too :-)<br>
<br>
cheers<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
balbi<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks &a=
mp; Regards<br>Vivek<br>
</div>

--e0cb4efe2f1459f05804cde474d0--

--===============3738637025722739261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3738637025722739261==--
