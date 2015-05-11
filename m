From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 04/10] mfd: cros_ec: Use a zero-length array for command
 data
Date: Mon, 11 May 2015 23:33:40 +0200
Message-ID: <55512034.3000206@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk> <1431166241-15775-5-git-send-email-javier.martinez@collabora.co.uk> <CAMHSBOXj3QvtCWX3WprDpfr2VN2+OpviCbazqr7EBZtt7m_i4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43473 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414AbbEKVdr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 17:33:47 -0400
In-Reply-To: <CAMHSBOXj3QvtCWX3WprDpfr2VN2+OpviCbazqr7EBZtt7m_i4g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gwendal Grignou <gwendal@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Hello,

Thanks all for testing and sorry for this issue.

On 05/11/2015 10:19 PM, Gwendal Grignou wrote:
> On Sat, May 9, 2015 at 3:10 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:

[snip]

>>
>>  static u32 ec_i2c_functionality(struct i2c_adapter *adap)
>> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
>> index b50c5b8b8a4d..090f8a75412a 100644
>> --- a/drivers/input/keyboard/cros_ec_keyb.c
>> +++ b/drivers/input/keyboard/cros_ec_keyb.c
>> @@ -149,16 +149,19 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>>  static int cros_ec_keyb_get_state(struct cros_ec_keyb *ckdev, uint8_t *kb_state)
>>  {
>>         int ret;
>> -       struct cros_ec_command msg = {
>> -               .command = EC_CMD_MKBP_STATE,
>> -               .insize = ckdev->cols,
>> -       };
>> +       struct cros_ec_command *msg = (struct cros_ec_command *)kb_state;
> Following amstan@ comments in 00/10 patch,
> I think there is something wrong here:
> kb_state should already have a cros_ec_command header, so that the
> lower layer can
> copy into the 'old' kb_state array directly.
> There will be no need for the memcpy later.
> 

True, the memcpy should not be needed but I copied at the beginning of kb_state
to avoid having to compute the kb_state + sizeof(struct cros_ec_command) offset
in cros_ec_keyb_process().

> Gwendal.
>>
>> -       ret = cros_ec_cmd_xfer(ckdev->ec, &msg);
>> -       if (ret < 0)
>> +       msg->command = EC_CMD_MKBP_STATE;
>> +       msg->insize = ckdev->cols;
>> +       msg->outsize = 0;
>> +

As Alexandru said, the EC is returning EC_RES_INVALID_VERSION and looking at
this code I see that there is a difference since v1 was using designated
initializers when declaring the struct cros_ec_command as a local variable in
the stack.

But in v2 the struct members are explicitly initialized since kb_state is not
initialized and I missed the version field so now it has an undefined value.

Heiko, Alexandru,

I don't have access to my Chromebooks right now but could you please test the
following patch [0] to see if that is the problem?

It seems I got it working on my test just out of luck since it happened that
version was initialized to 0 due the data it was on the stack.

Tomorrow when I've access to the Chromebooks I'll do more extensive testing
and see if I can reproduce the issue and if my assumption is correct.

Best regards,
Javier

[0]
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index ef3ba20f4560..4f233e248a4d 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -151,6 +151,7 @@ static int cros_ec_keyb_get_state(struct cros_ec_keyb *ckdev, uint8_t *kb_state)
 	int ret;
 	struct cros_ec_command *msg = (struct cros_ec_command *)kb_state;
 
+	msg->version = 0;
 	msg->command = EC_CMD_MKBP_STATE;
 	msg->insize = ckdev->cols;
 	msg->outsize = 0;
