From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RFC][PATCH 1/4] lcd: platform-lcd: Eliminate need for platform data
Date: Mon, 2 Jan 2012 23:21:46 +0530
Message-ID: <CAJuYYwQrfp6R=kSzXr6y0unDk9FtNxoy3Lt5QabdNMg9Qux=bg@mail.gmail.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
	<1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
	<20120102115959.GG2899@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120102115959.GG2899@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 2 January 2012 17:29, Mark Brown <broonie@opensource.wolfsonmicro.co=
m> wrote:
> On Mon, Jan 02, 2012 at 11:24:32AM +0530, Thomas Abraham wrote:
>
>> @@ -10,12 +10,3 @@
>> =A0 * published by the Free Software Foundation.
>> =A0 *
>> =A0*/
>> -
>> -struct plat_lcd_data;
>> -struct fb_info;
>> -
>> -struct plat_lcd_data {
>> - =A0 =A0 void =A0 =A0(*set_power)(struct plat_lcd_data *, unsigned =
int power);
>> - =A0 =A0 int =A0 =A0 (*match_fb)(struct plat_lcd_data *, struct fb_=
info *);
>> -};
>
> This is going to break all existing users as it will stop them compil=
ing
> - they'd either need to be converted en masse to the new style as par=
t
> of the commit doing this or the driver would need to support both
> platform data and new style configuration simultaneously.

Yes, it is true that it will break other users and is mentioned it in
the cover letter of this patchset.

Your point on maintaining support for both old and new formats is
helpful. But I am not sure if maintaining support for both formats is
the right thing to do. As most of the ARM platforms will switch to
using dt, maybe converting all of them to new format would be better.
I will try doing this and prepare a patch.

Thanks,
Thomas.
