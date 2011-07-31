From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 1/3] i2c: s3c2410: Keep a copy of platform data and use it.
Date: Sun, 31 Jul 2011 21:33:58 +0100
Message-ID: <CAJuYYwRHC3BbRAAMPNOJxwAA9tRnHwVjgjU7bx2y2izNyyF4iQ@mail.gmail.com>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
	<1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
	<20110731035105.GG24334@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:60863 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750940Ab1GaUd7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jul 2011 16:33:59 -0400
In-Reply-To: <20110731035105.GG24334@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Hi Grant,

On 31 July 2011 04:51, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Fri, Jul 22, 2011 at 03:48:36PM +0530, Thomas Abraham wrote:
>> The platform data is copied into driver's private data and the copy =
is
>> used for all access to the platform data. This simpifies the additio=
n
>> of device tree support for the i2c-s3c2410 driver.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 =A07 +++++--
>> =A01 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i=
2c-s3c2410.c
>> index 6c00c10..e132168 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -78,6 +78,7 @@ struct s3c24xx_i2c {
>> =A0 =A0 =A0 struct resource =A0 =A0 =A0 =A0 *ioarea;
>> =A0 =A0 =A0 struct i2c_adapter =A0 =A0 =A0adap;
>>
>> + =A0 =A0 struct s3c2410_platform_i2c =A0 =A0 pdata;
>
> After looking at a bunch of patches, there is another way do do this
> I think. =A0Instead of copying pdata into the private data structure,=
 it
> can remain as a pointer if the DT code uses devm_kzmalloc to allocate
> a s3c2410_platform_i2c structure when needed.
>
> I leave it up to you (and Ben) though as to which you prefer. =A0I'm
> okay either way, and you can add:

I will submit another patch with the changes you have suggested. Ben
could then choose the approach that he feels is the best.

>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>

Thanks Grant.


Regards,
Thomas.

>
>
[...]
