From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 3/8] drm/panel: simple: Add support for auo_b133htn01 panel
Date: Wed, 30 Jul 2014 19:12:37 +0530
Message-ID: <CAEC9eQMzgpEzZsP7F7hGF16do+=Et7UpJDm3+EqiYmzdtqpbOQ@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
	<1406316130-4744-4-git-send-email-ajaykumar.rs@samsung.com>
	<20140730105132.GF29590@ulmo>
	<CAEC9eQN0mqhiEzn5mkVKu+cAqVkdQ90F73q9cNf76gMAZZ-LRg@mail.gmail.com>
	<20140730133015.GN29590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:43816 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbaG3Nmi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 09:42:38 -0400
In-Reply-To: <20140730133015.GN29590@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On Wed, Jul 30, 2014 at 7:00 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Jul 30, 2014 at 05:02:11PM +0530, Ajay kumar wrote:
>> On Wed, Jul 30, 2014 at 4:21 PM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> > On Sat, Jul 26, 2014 at 12:52:05AM +0530, Ajay Kumar wrote:
>> >> Add panel_desc structure for auo_b133htn01 eDP panel.
>> >>
>> >> Also, modify the panel_simple routines to support timing_parameter
>> >> delays if mentioned in the panel_desc structure.
>> >>
>> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> >> ---
>> >>  .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +++
>> >>  drivers/gpu/drm/panel/panel-simple.c               |   47 ++++++++++++++++++++
>> >>  2 files changed, 54 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01.txt
>> >
>> > I think this should be two patches, one which adds the delay parameters
>> > and another which adds support for the new panel.
>> Ok. Will split it.
>
> I was going to propose that I split this up myself so you no longer have
> to worry about it. I can easily apply the changes we discussed. But if
> you prefer to keep it in one series that works for me too.
Well, you can only take in the "delay" structure as of now.

Ajay
>> > In general I think it would be good to have a description of these in
>> > the struct panel_desc structure, something like this perhaps:
>> >
>> >         /**
>> >          * @prepare: the time (in milliseconds) that it takes for the panel
>> >          *           to become ready and start receiving video data
>> >          * @enable: the time (in milliseconds) that it takes for the panel
>> >          *          to display the first valid frame after starting to
>> >          *          receive video data
>> >          * @disable: the time (in milliseconds) that it takes for the panel
>> >          *           to turn the display off (no content is visible)
>> >          * @unprepare: the time (in milliseconds) that it takes for the panel
>>                         to power down itself completely.
>> >          */
>> >         struct {
>> >                 unsigned int prepare;
>> >                 unsigned int enable;
>> >                 unsigned int disable;
>> >                 unsigned int unprepare;
>> >         } delay;
>> >
>> > For prepare and enable delays this would mean that they should take
>> > effect at the very end of the .prepare() and .enable() functions,
>> > respectively. For disable in means that it should be at the end (for
>> > example to take into account the time it takes for backlight to
>> > completely turn off). For unprepare I have no idea what we would need it
>> > for. And the new panel that you're adding in this patch doesn't use it
>> > either, so perhaps it can just be left out (for now)?
>> Actually, there was a typo.
>> That should have been .unprepare_stage_delay = 50.
>> This is needed because panels need some delay before powering
>> them on again.
>> As in, assume you are doing a test to turn on/off display continuously,
>> Then, the delay between
>> (N - 1)th cycle poweroff to Nth cycle poweron should be at least 500ms.
>> That's what the datasheet says! And, somehow 50ms works fine for me.
>
> Okay, that makes sense then.
>
> Thierry
