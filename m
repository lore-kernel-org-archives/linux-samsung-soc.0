From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 2/3] i2c: s3c2410: Add device tree support
Date: Sun, 31 Jul 2011 21:50:26 +0100
Message-ID: <CAJuYYwSR6x=ZhnFUAdG9_eRSbcE1UtkcMNVfxJ3kexuVg39gOg@mail.gmail.com>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
	<1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
	<1311329918-8105-3-git-send-email-thomas.abraham@linaro.org>
	<20110731035336.GH24334@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:59813 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370Ab1GaUu2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jul 2011 16:50:28 -0400
In-Reply-To: <20110731035336.GH24334@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Hi Grant,

On 31 July 2011 04:53, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Fri, Jul 22, 2011 at 03:48:37PM +0530, Thomas Abraham wrote:
>> Add device tree probe support for Samsung's s3c2410 i2c driver.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0.../devicetree/bindings/i2c/samsung-i2c.txt =A0 =A0 =A0 =A0| =A0 =
44 +++++++++++++++++
>> =A0drivers/i2c/busses/i2c-s3c2410.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 51 +++++++++++++++++++-
>> =A02 files changed, 94 insertions(+), 1 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/i2c/samsung-=
i2c.txt
>>

[...]

>>
>> - =A0 =A0 ret =3D i2c_add_numbered_adapter(&i2c->adap);
>> + =A0 =A0 ret =3D (pdev->dev.of_node) ? i2c_add_adapter(&i2c->adap) =
:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 i2c_add_numbered_adapter(&i2c->adap);
>
> i2c_add_numbered_adapter will do the right thing now if i2c->adap.nr
> is set to -1 when a bus number needs to be dynamically allocated. =A0=
You can simplify this.
>

Ok. I will change it to just use the i2c_add_numbered_adapter function
(just noticed your patch).

A question related to bus number: In case of dynamically allocated bus
number, how would the application know to which i2c bus a particular
slave device is connected? The application would be programmed to look
for a slave device on a particular bus. But with dynamic i2c bus
number, how should application find out the correct bus number?

>> =A0 =A0 =A0 if (ret < 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to add bus t=
o i2c core\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_cpufreq;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 of_i2c_register_devices(&i2c->adap);
>> =A0 =A0 =A0 platform_set_drvdata(pdev, i2c);
>>

[...]

>> =A0 =A0 =A0 },
>
> Looks pretty good. =A0After fixing the above comment, feel free to ad=
d
> my:
>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>

Thanks Grant. I will fix as per your comment.

Regards,
Thomas.

>
>> =A0};
>>
>> --
>> 1.6.6.rc2
>>
>
