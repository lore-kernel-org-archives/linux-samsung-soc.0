From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 3/8] drm/panel: simple: Add support for auo_b133htn01
 panel
Date: Wed, 30 Jul 2014 17:02:11 +0530
Message-ID: <CAEC9eQN0mqhiEzn5mkVKu+cAqVkdQ90F73q9cNf76gMAZZ-LRg@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-4-git-send-email-ajaykumar.rs@samsung.com>
 <20140730105132.GF29590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140730105132.GF29590@ulmo>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 30, 2014 at 4:21 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sat, Jul 26, 2014 at 12:52:05AM +0530, Ajay Kumar wrote:
>> Add panel_desc structure for auo_b133htn01 eDP panel.
>>
>> Also, modify the panel_simple routines to support timing_parameter
>> delays if mentioned in the panel_desc structure.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +++
>>  drivers/gpu/drm/panel/panel-simple.c               |   47 ++++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01.txt
>
> I think this should be two patches, one which adds the delay parameters
> and another which adds support for the new panel.
Ok. Will split it.

>> diff --git a/Documentation/devicetree/bindings/panel/auo,b133htn01.txt b/Documentation/devicetree/bindings/panel/auo,b133htn01.txt
>> new file mode 100644
>> index 0000000..302226b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/panel/auo,b133htn01.txt
>> @@ -0,0 +1,7 @@
>> +AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
>> +
>> +Required properties:
>> +- compatible: should be "auo,b133htn01"
>> +
>> +This binding is compatible with the simple-panel binding, which is specified
>> +in simple-panel.txt in this directory.
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index fb0cfe2..cbbb1b8 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -41,6 +41,13 @@ struct panel_desc {
>>               unsigned int width;
>>               unsigned int height;
>>       } size;
>> +
>> +     struct {
>> +             unsigned int prepare_stage_delay;
>> +             unsigned int enable_stage_delay;
>> +             unsigned int disable_stage_delay;
>> +             unsigned int unprepare_stage_delay;
>> +     } timing_parameter;
>
> These are overly long in my opinion, how about:
>
>         struct {
>                 unsigned int prepare;
>                 unsigned int enable;
>                 unsigned int disable;
>                 unsigned int unprepare;
>         } delay;
Ok, will use this.

> ? Oh, and this should probably mention that it's in milliseconds. On
> that note, do you think we'll ever need microsecond resolution? I don't
> think I've ever seen a panel datasheet mentioning that kind of
> granularity.
Nope. All in milliseconds.

>>  struct panel_simple {
>> @@ -105,6 +112,8 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>>               gpiod_set_value_cansleep(p->enable_gpio, 0);
>>
>>       regulator_disable(p->supply);
>> +     if (p->desc)
>
> Should have a blank line between "regulator_disable(...)" and "if ...".
> Also it's not useful to check for p->desc, really, since it's a bug if
> that is NULL.
Well, I added this check because I used just the "simple-panel" compatible
for panel node on snow. This check won't be needed anymore.

> However I think it would be good to check for the delay being set, like
> so:
>
>         if (p->desc->delay.unprepare)
>                 msleep(p->desc->delay.unprepare);
Ok, will change it.

> I'm not sure about the placement of the delay here, see below for more.
>
>> @@ -142,6 +154,9 @@ static int panel_simple_prepare(struct drm_panel *panel)
>>               return err;
>>       }
>>
>> +     if (p->desc)
>> +             msleep(p->desc->timing_parameter.prepare_stage_delay);
>> +
>>       if (p->enable_gpio)
>>               gpiod_set_value_cansleep(p->enable_gpio, 1);
>
> Should the delay not be *after* all steps in prepare have been
> performed? That way drivers can use it to specify the time that a panel
> needs to "internally" become ready after they've been power up (for
> example).
Right. I will move that delay down.

>>
>> @@ -157,6 +172,8 @@ static int panel_simple_enable(struct drm_panel *panel)
>>       if (p->backlight_enabled)
>>               return 0;
>>
>> +     if (p->desc)
>> +             msleep(p->desc->timing_parameter.enable_stage_delay);
>>       if (p->backlight) {
>>               p->backlight->props.power = FB_BLANK_UNBLANK;
>>               backlight_update_status(p->backlight);
>
> I think here the delay makes sense where it is because it allows the
> panel driver to wait for a given amount of time (after video data has
> been sent by the display controller) until the first "good" frame is
> visible.
Exactly!

> In general I think it would be good to have a description of these in
> the struct panel_desc structure, something like this perhaps:
>
>         /**
>          * @prepare: the time (in milliseconds) that it takes for the panel
>          *           to become ready and start receiving video data
>          * @enable: the time (in milliseconds) that it takes for the panel
>          *          to display the first valid frame after starting to
>          *          receive video data
>          * @disable: the time (in milliseconds) that it takes for the panel
>          *           to turn the display off (no content is visible)
>          * @unprepare: the time (in milliseconds) that it takes for the panel
                        to power down itself completely.
>          */
>         struct {
>                 unsigned int prepare;
>                 unsigned int enable;
>                 unsigned int disable;
>                 unsigned int unprepare;
>         } delay;
>
> For prepare and enable delays this would mean that they should take
> effect at the very end of the .prepare() and .enable() functions,
> respectively. For disable in means that it should be at the end (for
> example to take into account the time it takes for backlight to
> completely turn off). For unprepare I have no idea what we would need it
> for. And the new panel that you're adding in this patch doesn't use it
> either, so perhaps it can just be left out (for now)?
Actually, there was a typo.
That should have been .unprepare_stage_delay = 50.
This is needed because panels need some delay before powering
them on again.
As in, assume you are doing a test to turn on/off display continuously,
Then, the delay between
(N - 1)th cycle poweroff to Nth cycle poweron should be at least 500ms.
That's what the datasheet says! And, somehow 50ms works fine for me.

Ajay
>> +static const struct panel_desc auo_b133htn01 = {
>> +     .modes = &auo_b133htn01_mode,
>> +     .num_modes = 1,
>> +     .size = {
>> +             .width = 293,
>> +             .height = 165,
>> +     },
>> +     .timing_parameter = {
>> +             .prepare_stage_delay = 105,
>> +             .enable_stage_delay = 20,
>> +             .prepare_stage_delay = 50,
>
> I take it that this last one was supposed to be .enable_stage_delay
> since you've already set up .prepare_stage_delay.
>
> Thierry
