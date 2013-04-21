From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Sun, 21 Apr 2013 23:05:45 +0900
Message-ID: <CAAQKjZN78+WTO+Q3eWDAS2iF3zPxo7tjysAd3nwbGEKXmz8zUQ@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<CAAQKjZMoXj-YFYQhkQOwL-VJgKP0hgMxQ-vqiBCfuinBSCgmHg@mail.gmail.com>
	<CAKohpon6_w=ANHTrJYNAJP_c=-prqUhcOfzBajpMgi3Yy5zcwQ@mail.gmail.com>
	<2021753.aZ0KODlsRB@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866924296=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <2021753.aZ0KODlsRB@flatron>
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
Cc: linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0866924296==
Content-Type: multipart/alternative; boundary=089e011837d4cf6af404dadf72c7

--089e011837d4cf6af404dadf72c7
Content-Type: text/plain; charset=ISO-8859-1

2013/4/21 Tomasz Figa <tomasz.figa@gmail.com>

> On Sunday 21 of April 2013 13:23:10 Viresh Kumar wrote:
> > On 20 April 2013 20:56, Inki Dae <inki.dae@samsung.com> wrote:
> > > Sorry for being late. I think clk_prepare/unprepare are nothing to do
> > > yet in case of Exynos but those might be used for in the future so
> > > your patch looks good to me as is.
> > >
> > > Applied. :)
> >
>
> Hmm. Now, after searching for this thread in dri-devel archives, I'm
> wondering why I haven't received some of messages from this thread through
> linux-samsung-soc mailing list...
>
> I believe linux-samsung-soc list exists to collect all threads related to
> Samsung SoCs for people that don't want to subscribe to lists like dri-
> devel, on which there is a lot of threads irrelevant to them, with the
> risk of missing the important ones.
>
> Please always make sure that any discussion about Samsung SoCs (patches in
> particular) is going through linux-samsung-soc as well.
>
>
Thanks for your advice. As you said, some people might not want to
subscribe to some mainling lists they don't want. And I think that the main
mailing list on this patch is dri-devel so you must receive this email
thread if you subscribed to the dri-devel. Anyway it would be best to share
this all mailing lists included in this email thread but if so, I have no
doubt to receive email bumb. :(

Thanks,
Inki Dae


> Thanks in advance.
>
> Best regards,
> Tomasz
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--089e011837d4cf6af404dadf72c7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">2013/4/21 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:tomasz.fi=
ga@gmail.com" target=3D"_blank">tomasz.figa@gmail.com</a>&gt;</span><br><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-col=
or:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=3D=
"gmail_quote">
<div class=3D"im">On Sunday 21 of April 2013 13:23:10 Viresh Kumar wrote:<b=
r>
&gt; On 20 April 2013 20:56, Inki Dae &lt;<a href=3D"mailto:inki.dae@samsun=
g.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt; &gt; Sorry for being late. I think clk_prepare/unprepare are nothing t=
o do<br>
&gt; &gt; yet in case of Exynos but those might be used for in the future s=
o<br>
&gt; &gt; your patch looks good to me as is.<br>
&gt; &gt;<br>
&gt; &gt; Applied. :)<br>
&gt;<br>
<br>
</div>Hmm. Now, after searching for this thread in dri-devel archives, I&#3=
9;m<br>
wondering why I haven&#39;t received some of messages from this thread thro=
ugh<br>
linux-samsung-soc mailing list...<br>
<br>
I believe linux-samsung-soc list exists to collect all threads related to<b=
r>
Samsung SoCs for people that don&#39;t want to subscribe to lists like dri-=
<br>
devel, on which there is a lot of threads irrelevant to them, with the<br>
risk of missing the important ones.<br>
<br>
Please always make sure that any discussion about Samsung SoCs (patches in<=
br>
particular) is going through linux-samsung-soc as well.<br>
<br></blockquote><div>=A0</div><div>Thanks for your advice. As you said, so=
me people might not want to subscribe to some mainling lists they don&#39;t=
 want. And I think that=A0the main mailing list on this patch=A0is dri-deve=
l so you must receive this email thread if you subscribed to the dri-devel.=
 Anyway it would be best to share this all mailing lists included in this e=
mail thread but if so, I have no doubt to receive=A0email bumb. :(</div>
<div>=A0</div><div>Thanks,</div><div>Inki Dae</div><div>=A0</div><blockquot=
e style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(=
204,204,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_=
quote">

Thanks in advance.<br>
<br>
Best regards,<br>
Tomasz<br>
<div><div class=3D"h5"><br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br></div></div>

--089e011837d4cf6af404dadf72c7--

--===============0866924296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0866924296==--
