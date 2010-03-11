From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Thu, 11 Mar 2010 13:02:34 +0900
Message-ID: <1b68c6791003102002l43de16ccq949b28a9fb856253@mail.gmail.com>
References: <201003100911.06148.elendil@planet.nl>
	 <201003110351.40711.elendil@planet.nl>
	 <1b68c6791003101854k26fcf327pfb4bf321484f7e4f@mail.gmail.com>
	 <201003110442.24196.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.26]:38655 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755928Ab0CKECf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 23:02:35 -0500
Received: by qw-out-2122.google.com with SMTP id 9so360916qwb.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Mar 2010 20:02:35 -0800 (PST)
In-Reply-To: <201003110442.24196.elendil@planet.nl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Frans Pop <elendil@planet.nl>
Cc: linux-samsung-soc@vger.kernel.org

On Thu, Mar 11, 2010 at 12:42 PM, Frans Pop <elendil@planet.nl> wrote:
> On Thursday 11 March 2010, jassi brar wrote:
>> On Thu, Mar 11, 2010 at 11:51 AM, Frans Pop <elendil@planet.nl> wrot=
e:
>> > On Thursday 11 March 2010, jassi brar wrote:
>> >> On Thu, Mar 11, 2010 at 1:17 AM, Frans Pop <elendil@planet.nl> wr=
ote:
>> >> > On Wednesday 10 March 2010, jassi brar wrote:
>> >> >> On Wed, Mar 10, 2010 at 5:11 PM, Frans Pop <elendil@planet.nl>
> wrote:
>> >> >> > When building with an SMDK6410 config with CONFIG_SPI_S3C64X=
X=3Dm
>> >> >> > I get the following compilation error:
>> >> >> >
>> >> >> > CC [M] =C2=A0drivers/spi/spi_s3c64xx.o
>> >> >> > drivers/spi/spi_s3c64xx.c:31:22: error: plat/spi.h: No such =
file
>> >> >> > or directory
>> >> >> >
>> >> >> > This is with Ben Dooks' next-samsung branch merged into 2.6.=
33.
>> >> >>
>> >> >> There has recently been a major shuffle of headers in plat and
>> >> >> mach, please test against some unmodified kernel and let me kn=
ow
>> >> >> which one if the error still occurs. Maybe you(or I) can submi=
t a
>> >> >> fix upstream.
>> >> >
>> >> > The same error occurs with vanilla 2.6.33.
>> >>
>> >> yeah, i remember. that was due to driver being accepted in SPI tr=
ee
>> >> but plat headers put on hold in S3C ARCH tree.
>> >> The patches are already queued on Ben Dooks' and Grant Likely's t=
ree.
>> >
>> > Which branch in Ben's tree would that be? As mentioned above I sti=
ll
>> > see the error when using his current "next-samsung" branch...
>> > I have not try building with Grant's tree.
>>
>> try for-rmk/samsung6
>
> That branch is identical to next-samsung...
>
Then you need patches from Grant Likely's tree.
The driver now includes a new header plat/s3c64xxx-spi.h instead
Check http://git.secretlab.ca/?p=3Dlinux-2.6.git;a=3Dsummary
branch 'next' or 'next-spi'
