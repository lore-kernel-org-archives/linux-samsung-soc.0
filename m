From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable routines
Date: Tue, 22 Apr 2014 20:06:19 +0530
Message-ID: <CAEC9eQO8Kahh2YVO4nCjk2m+TzJNJ_iSkVRLe0NM_yqL9uPNaw@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140422081948.GA17275@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2035818636=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140422081948.GA17275@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2035818636==
Content-Type: multipart/alternative; boundary=047d7bdc163207477304f7a28a27

--047d7bdc163207477304f7a28a27
Content-Type: text/plain; charset=UTF-8

Hi Thierry,


On Tue, Apr 22, 2014 at 1:49 PM, Thierry Reding <thierry.reding@gmail.com>
wrote:
> On Tue, Apr 22, 2014 at 04:09:11AM +0530, Ajay Kumar wrote:
>> Most of the panels need an init sequence as mentioned below:
>>       -- poweron LCD unit/LCD_EN
>>       -- start video data
>>       -- poweron LED unit/BL_EN
>> And, a de-init sequence as mentioned below:
>>       -- poweroff LED unit/BL_EN
>>       -- stop video data
>>       -- poweroff LCD unit/LCD_EN
>> With existing callbacks for drm panel, we cannot accomodate such panels,
>> since only two callbacks, i.e "panel_enable" and panel_disable are
supported.
>>
>> This patch adds:
>>       -- "pre_enable" callback which can be called before
>>       the actual video data is on, and then call the "enable"
>>       callback after the video data is available.
>>
>>       -- "post_disable" callback which can be called after
>>       the video data is off, and use "disable" callback
>>       to do something before switching off the video data.
>>
>> Now, we can easily map the above scenario as shown below:
>>       poweron LCD unit/LCD_EN = "pre_enable" callback
>>       poweron LED unit/BL_EN = "enable" callback
>>       poweroff LED unit/BL_EN = "disable" callback
>>       poweroff LCD unit/LCD_EN = "post_disable" callback
>
> I don't like this. What happens when the next panel comes around that
> has a yet slightly different requirement? Will we introduce a new
> pre_pre_enable() and post_post_disable() function then?
>
As I have already explained, these 2 callbacks are sufficient enough to
take care
the power up/down sequence for LVDS and eDP panels. And, definitely having
just 2 callbacks "enable" and "disable" is not at all sufficient.

I initially thought of using panel_simple_enable from panel-simple driver.
But it doesn't go well with case wherein there are 2 regulators(one for LCD
and one for LED)
a BL_EN signal etc. And, often(Believe me, I have referred to both eDP
panel datasheets
and LVDS panel datasheets) proper powerup sequence for such panels is as
mentioned below:

powerup:
-- power up the supply (LCD_VCC).
-- start video data.
-- enable backlight.

powerdown
-- disable backlight.
-- stop video data.
-- power off the supply (LCD VCC)

For the above cases, if I have to somehow fit in all the required settings,
it breaks the sequence and I end up getting glitches during bootup/DPMS.

Also, when the drm_bridge can support pre_enable and post_disable, why not
drm_panel provide that both should work in tandem?

> There's got to be a better way to solve this.
>
> Thierry


Thanks and Regards,
Ajay Kumar

--047d7bdc163207477304f7a28a27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thierry,<div><br><br>On Tue, Apr 22, 2014 at 1:49 PM, T=
hierry Reding &lt;<a href=3D"mailto:thierry.reding@gmail.com">thierry.redin=
g@gmail.com</a>&gt; wrote:<br>&gt; On Tue, Apr 22, 2014 at 04:09:11AM +0530=
, Ajay Kumar wrote:<br>
&gt;&gt; Most of the panels need an init sequence as mentioned below:<br>&g=
t;&gt; =C2=A0 =C2=A0 =C2=A0 -- poweron LCD unit/LCD_EN<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 -- start video data<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 -- power=
on LED unit/BL_EN<br>&gt;&gt; And, a de-init sequence as mentioned below:<b=
r>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 -- poweroff LED unit/BL_EN<br>&gt;&gt; =C2=A0=
 =C2=A0 =C2=A0 -- stop video data<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 -- power=
off LCD unit/LCD_EN<br>&gt;&gt; With existing callbacks for drm panel, we c=
annot accomodate such panels,<br>&gt;&gt; since only two callbacks, i.e &qu=
ot;panel_enable&quot; and panel_disable are supported.<br>
&gt;&gt;<br>&gt;&gt; This patch adds:<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 -- &=
quot;pre_enable&quot; callback which can be called before<br>&gt;&gt; =C2=
=A0 =C2=A0 =C2=A0 the actual video data is on, and then call the &quot;enab=
le&quot;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 callback after the video data is =
available.<br>
&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 -- &quot;post_disable&quot; callb=
ack which can be called after<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 the video da=
ta is off, and use &quot;disable&quot; callback<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 to do something before switching off the video data.<br>
&gt;&gt;<br>&gt;&gt; Now, we can easily map the above scenario as shown bel=
ow:<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 poweron LCD unit/LCD_EN =3D &quot;pre_=
enable&quot; callback<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 poweron LED unit/BL_=
EN =3D &quot;enable&quot; callback<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 poweroff LED unit/BL_EN =3D &quot;disable&quo=
t; callback<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 poweroff LCD unit/LCD_EN =3D &=
quot;post_disable&quot; callback<br>&gt;<br>&gt; I don&#39;t like this. Wha=
t happens when the next panel comes around that<br>
&gt; has a yet slightly different requirement? Will we introduce a new<br>&=
gt; pre_pre_enable() and post_post_disable() function then?<br>&gt;</div><d=
iv>As I have already explained, these 2 callbacks are sufficient enough to =
take care</div>
<div>the power up/down sequence for LVDS and eDP panels. And, definitely ha=
ving</div><div>just 2 callbacks &quot;enable&quot; and &quot;disable&quot; =
is not at all sufficient.</div><div><br></div><div>I initially thought of u=
sing panel_simple_enable from panel-simple driver.</div>
<div>But it doesn&#39;t go well with case wherein there are 2 regulators(on=
e for LCD and one for LED)</div><div>a BL_EN signal etc. And, often(Believe=
 me, I have referred to both eDP panel datasheets</div><div>and LVDS panel =
datasheets) proper powerup sequence for such panels is as mentioned below:<=
/div>
<div><br></div><div>powerup:</div><div>-- power up the supply (LCD_VCC).</d=
iv><div>-- start video data.</div><div>-- enable backlight.</div><div><br><=
/div><div>powerdown</div><div>-- disable backlight.</div><div>-- stop video=
 data.</div>
<div>-- power off the supply (LCD VCC)</div><div><br></div><div>For the abo=
ve cases, if I have to somehow fit in all the required settings,</div><div>=
it breaks the sequence and I end up getting glitches during bootup/DPMS.</d=
iv>
<div><br></div><div>Also, when the drm_bridge can support pre_enable and po=
st_disable, why not</div><div>drm_panel provide that both should work in ta=
ndem?</div><div><br></div><div>&gt; There&#39;s got to be a better way to s=
olve this.<br>
&gt;<br>&gt; Thierry<br><br></div><div><br></div><div>Thanks and Regards,</=
div><div>Ajay Kumar</div></div>

--047d7bdc163207477304f7a28a27--

--===============2035818636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2035818636==--
