From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 02/10] mfd: cros_ec: IRQs for cros_ec should be optional
Date: Wed, 18 Jun 2014 10:45:19 -0700
Message-ID: <CAD=FV=WJOup3ZT6vGbkpgWCx6q4MOKxROicS_J9bdatNg+OrhQ@mail.gmail.com>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
	<1402954800-28215-3-git-send-email-dianders@chromium.org>
	<20140618075551.GJ21030@lee--X1>
	<CAD=FV=Wn3u+DNerFBNpbbLhBPa+3A5bvrRiBXNq=vyRA00+-uQ@mail.gmail.com>
	<20140618164621.GB25353@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140618164621.GB25353@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, "broonie@kernel.org" <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Lee,

On Wed, Jun 18, 2014 at 9:46 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 18 Jun 2014, Doug Anderson wrote:
>
>> Lee,
>>
>> On Wed, Jun 18, 2014 at 12:55 AM, Lee Jones <lee.jones@linaro.org> wrote:
>> > On Mon, 16 Jun 2014, Doug Anderson wrote:
>> >
>> >> From: Bill Richardson <wfrichar@chromium.org>
>> >>
>> >> Preparing the way for the LPC device, which is just a plaform_device without
>> >> interrupts.
>> >>
>> >> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
>> >> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> >> ---
>> >>  drivers/mfd/cros_ec.c | 26 +++++++++++++-------------
>> >>  1 file changed, 13 insertions(+), 13 deletions(-)
>> >>
>> >> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
>> >> index 38fe9bf..bd6f936 100644
>> >> --- a/drivers/mfd/cros_ec.c
>> >> +++ b/drivers/mfd/cros_ec.c
>> >> @@ -119,17 +119,15 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>> >>                       return -ENOMEM;
>> >>       }
>> >>
>> >> -     if (!ec_dev->irq) {
>> >> -             dev_dbg(dev, "no valid IRQ: %d\n", ec_dev->irq);
>> >> -             return err;
>> >> -     }
>> >> -
>> >> -     err = request_threaded_irq(ec_dev->irq, NULL, ec_irq_thread,
>> >> -                                IRQF_TRIGGER_LOW | IRQF_ONESHOT,
>> >> -                                "chromeos-ec", ec_dev);
>> >> -     if (err) {
>> >> -             dev_err(dev, "request irq %d: error %d\n", ec_dev->irq, err);
>> >> -             return err;
>> >> +     if (ec_dev->irq) {
>> >> +             err = request_threaded_irq(ec_dev->irq, NULL, ec_irq_thread,
>> >> +                                     IRQF_TRIGGER_LOW | IRQF_ONESHOT,
>> >> +                                     "chromeos-ec", ec_dev);
>> >
>> > Is there anything stopping you using the devm_* version?
>>
>> I'm generally quite hesitant about using the devm_ IRQ functions.
>> Requesting an IRQ enables the IRQ at the time of request and freeing
>> it disables it, right?  Leaving it up to the the devm subsystem to
>> disable your IRQ tends to be a race waiting to happen if an IRQ
>> happens after you've freed all your memory / cleaned up all your
>> state.
>>
>> Looking at cros_ec in particular though:
>>
>> * Right now the last thing done in cros_ec_remove() (which is the last
>> thing in both cros_ec_i2c_remove and cros_ec_spi_remove) is to free
>> the IRQ.  That means that you're right: we could switch to devm_ in
>> this case and it wouldn't introduce any new bugs.
>>
>> * ...but I'm not convinced that the location of the free_irq() today
>> is quite right.  I couldn't actually get it to crash or hang, but
>> there is a time period where we've called mfd_remove_devices() and the
>> IRQ is still active.  That doesn't seem like a super great situation
>> to be in.  I'll add a move of the irq_free to the patch series.
>
> I guess if you're concerned about ordering you could always use
> devm_free_irq() in the places where you think it should be freed
> earlier than release.  I'm pretty sure that discludes the failure
> patch in probe() though, so we'd still be able to rid a few lines.

Hmmm, I'd even vote to move the IRQ request to be the last thing in
probe (which would also mean that the devm wouldn't be used but would
then require us to call mfd_remove_devices()).  ...but I can't find
any good reason that we need to do that.

Oh, dang.  I just looked at the next local patch in the list of local
ones.  ...it totally rips this code out and moves the IRQ to
cros_ec_keyboard where it belongs (the infrastructure didn't really
allow more than one person to use this anyway).  I'll just squash this
patch there and we're done.  Sorry for the noise!  :(


-Doug
