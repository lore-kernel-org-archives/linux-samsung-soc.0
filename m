From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH v1 0/2]
Date: Fri, 3 Jun 2016 13:45:52 +0800
Message-ID: <57511990.9050906@rock-chips.com>
References: <1464701856-8695-1-git-send-email-ykk@rock-chips.com>
 <20160531143831.GK7231@phenom.ffwll.local> <574E4E51.1030308@rock-chips.com>
 <20160602141910.GL7231@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0758863197=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160602141910.GL7231@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: daniel.vetter@intel.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, tfiga@chromium.org, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0758863197==
Content-Type: multipart/alternative;
 boundary="------------030007060602050707050203"

This is a multi-part message in MIME format.
--------------030007060602050707050203
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 06/02/2016 10:19 PM, Daniel Vetter wrote:
> On Wed, Jun 01, 2016 at 10:54:09AM +0800, Yakir Yang wrote:
>> Hi Daniel,
>>
>> On 05/31/2016 10:38 PM, Daniel Vetter wrote:
>>> On Tue, May 31, 2016 at 09:37:36PM +0800, Yakir Yang wrote:
>>>> The full name of PSR is Panel Self Refresh, panel device could refresh
>>>> itself with the hardware framebuffer in panel, this would make a lots
>>>> of sense to save the power consumption.
>>>>
>>>> For example, when desktop haven't change the context for a long time,
>>>> then we could refresh the data to the hardware framebuffer of panel,
>>>> and then let panel enter into PSR mode. After that system could poweroff
>>>> the LCDC controller and eDP controller, just let panel refresh the screen
>>>> by itself.
>>>>
>>>> It's hard to decide when panel should enter into PSR or exit from PSR, in
>>>> this time I chose to let the drm_vblank enable/disable event driver the PSR.
>>>>
>>>> This thread is based on Mark's RK3399 VOP thread[0] and my RK3399 eDP
>>>> thread[1].
>>>>
>>>> [0]: https://patchwork.kernel.org/patch/8886041/
>>>> [1]: https://patchwork.kernel.org/patch/9132713/
>>> Looks like you didn't wire up the drm_framebuffer->funcs->dirty callback
>>> for manual upload of simple clients like bootsplash or fbdev. I think
>>> that's needed. At least it's needed for every other manual upload dsi and
>>> edp psr implementation.
>>> -Daniel
>> That's great, thanks for your remind. Seems like userspace which does
>> frontbuffer rendering must call this ioctl to flush out the changes on
>> manual-update display outputs. It's helpful to hook this callback to
>> notify eDP refresh the eDP RFB(remote frame buffer).
>>
>> But I think this is hard to used on Rockchip eDP controller, Rockchip eDP
>> driver just used two modes, Sink Device PSR_S0 (PSR inactive), and Sink
>> Device PSR_S2 (PSR active, display from RFB).
>>
>> I think the "dirty" callback is only used when Sink device enter into PSR_S3
>> mode (PSR active, capture and display), need to update the remote frame
>> buffer. But on Rockchip platform the panel would be very easy to lose frame
>> in this PSR mode. I'm confused in this case, so I didn't enable that.
>>
>> If we didn't enable the PSR_S3 mode, then we don't need to update the panel
>> remote frame buffer, so this "->dirty" callback would be unused in this
>> case.
> Sorry missed your reply here somehow. Every time you don't scan out the
> drm_framebuffer directly, but from any kind of intermediate buffer, you
> _must_ implement the dirty callback. Usually the simplest way is to kick
> the device out of self-refresh and arm the time to re-enter self-refresh.

Sounds good, use timer to driver the PSR status, and abandon the vblank
enable/disable event. Okay, I start to do some experiments.

> I'm not entirely clear where your RFB is, so no idea whether that is
> scanning out from the drm_framebuffer data directly, or whether that's
> some on-chip or in-sink framebuffer cache.

RFB is an in-sink framebuffer cache. When Sink enter into PSR_State1 or
PSR_State3, then it can capture the eDP timing from source to update the 
RFB.



> We have a ridiculously nasty testuite in i-g-t for all these cases (we use
> it to validate our framebuffer compression code, psr code and soon also
> dsi manual upload). Unfortunately it's not yet ported over to be a generic
> testcase. But at least for PSR that would be easy, since every PSR panel
> has eDP sink crc support. And the testcase does require some kind of
> display CRC support to validate actual screen contents, as opposed to
> what's in memory in the drm_framebuffer.
> -Daniel

Sorry, I'm not very clear about what you mean, seems you have a reference
code about PSR test ;)

Thanks,
- Yakir


--------------030007060602050707050203
Content-Type: multipart/related;
 boundary="------------070109080706030004050007"


--------------070109080706030004050007
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Daniel,<br>
    <br>
    <div class="moz-cite-prefix">On 06/02/2016 10:19 PM, Daniel Vetter
      wrote:<br>
    </div>
    <blockquote cite="mid:20160602141910.GL7231@phenom.ffwll.local"
      type="cite">
      <pre wrap="">On Wed, Jun 01, 2016 at 10:54:09AM +0800, Yakir Yang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Daniel,

On 05/31/2016 10:38 PM, Daniel Vetter wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Tue, May 31, 2016 at 09:37:36PM +0800, Yakir Yang wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">The full name of PSR is Panel Self Refresh, panel device could refresh
itself with the hardware framebuffer in panel, this would make a lots
of sense to save the power consumption.

For example, when desktop haven't change the context for a long time,
then we could refresh the data to the hardware framebuffer of panel,
and then let panel enter into PSR mode. After that system could poweroff
the LCDC controller and eDP controller, just let panel refresh the screen
by itself.

It's hard to decide when panel should enter into PSR or exit from PSR, in
this time I chose to let the drm_vblank enable/disable event driver the PSR.

This thread is based on Mark's RK3399 VOP thread[0] and my RK3399 eDP
thread[1].

[0]: <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/8886041/">https://patchwork.kernel.org/patch/8886041/</a>
[1]: <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/9132713/">https://patchwork.kernel.org/patch/9132713/</a>
</pre>
          </blockquote>
          <pre wrap="">Looks like you didn't wire up the drm_framebuffer-&gt;funcs-&gt;dirty callback
for manual upload of simple clients like bootsplash or fbdev. I think
that's needed. At least it's needed for every other manual upload dsi and
edp psr implementation.
-Daniel
</pre>
        </blockquote>
        <pre wrap="">That's great, thanks for your remind. Seems like userspace which does
frontbuffer rendering must call this ioctl to flush out the changes on
manual-update display outputs. It's helpful to hook this callback to
notify eDP refresh the eDP RFB(remote frame buffer).

But I think this is hard to used on Rockchip eDP controller, Rockchip eDP
driver just used two modes, Sink Device PSR_S0 (PSR inactive), and Sink
Device PSR_S2 (PSR active, display from RFB).

I think the "dirty" callback is only used when Sink device enter into PSR_S3
mode (PSR active, capture and display), need to update the remote frame
buffer. But on Rockchip platform the panel would be very easy to lose frame
in this PSR mode. I'm confused in this case, so I didn't enable that.

If we didn't enable the PSR_S3 mode, then we don't need to update the panel
remote frame buffer, so this "-&gt;dirty" callback would be unused in this
case.
</pre>
      </blockquote>
      <pre wrap="">
Sorry missed your reply here somehow. Every time you don't scan out the
drm_framebuffer directly, but from any kind of intermediate buffer, you
_must_ implement the dirty callback. Usually the simplest way is to kick
the device out of self-refresh and arm the time to re-enter self-refresh.
</pre>
    </blockquote>
    <br>
    Sounds good, use timer to driver the PSR status, and abandon the
    vblank<br>
    enable/disable event. Okay, I start to do some experiments.<br>
    <br>
    <blockquote cite="mid:20160602141910.GL7231@phenom.ffwll.local"
      type="cite">
      <pre wrap="">I'm not entirely clear where your RFB is, so no idea whether that is
scanning out from the drm_framebuffer data directly, or whether that's
some on-chip or in-sink framebuffer cache.
</pre>
    </blockquote>
    <br>
    RFB is an in-sink framebuffer cache. When Sink enter into PSR_State1
    or<br>
    PSR_State3, then it can capture the eDP timing from source to update
    the RFB.<br>
    <br>
    <img src="cid:part1.01040605.06000003@rock-chips.com" alt=""><br>
    <br>
    <blockquote cite="mid:20160602141910.GL7231@phenom.ffwll.local"
      type="cite">
      <pre wrap="">We have a ridiculously nasty testuite in i-g-t for all these cases (we use
it to validate our framebuffer compression code, psr code and soon also
dsi manual upload). Unfortunately it's not yet ported over to be a generic
testcase. But at least for PSR that would be easy, since every PSR panel
has eDP sink crc support. And the testcase does require some kind of
display CRC support to validate actual screen contents, as opposed to
what's in memory in the drm_framebuffer.
-Daniel
</pre>
    </blockquote>
    <br>
    Sorry, I'm not very clear about what you mean, seems you have a
    reference<br>
    code about PSR test ;)<br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
  </body>
</html>

--------------070109080706030004050007
Content-Type: image/png;
 name="adidgajg.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.01040605.06000003@rock-chips.com>
Content-Disposition: inline;
 filename="adidgajg.png"

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
--------------070109080706030004050007--

--------------030007060602050707050203--


--===============0758863197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0758863197==--
