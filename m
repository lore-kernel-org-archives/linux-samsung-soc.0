From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 06/22] ASoC: samsung: i2s: Restore support
 for the secondary PCM
Date: Mon, 11 Feb 2019 15:50:33 +0100
Message-ID: <0d5c9877-ab82-9d80-5336-6324e111c32c@samsung.com>
References: <CGME20190207170105epcas1p3d4a1da9ae268f8e95b32fb499e5a1dad@epcas1p3.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com>
 <20190207170028.720-7-s.nawrocki@samsung.com>
 <CAJKOXPfTZ1EGUpL_Zg20iWYJFkoCvEhoQSM=f92N-NJwo1LsNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <CAJKOXPfTZ1EGUpL_Zg20iWYJFkoCvEhoQSM=f92N-NJwo1LsNg@mail.gmail.com>
Content-language: en-GB
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2/11/19 14:41, Krzysztof Kozlowski wrote:
>> @@ -1469,12 +1506,16 @@ static int samsung_i2s_remove(struct platform_device *pdev)
>>         struct samsung_i2s_priv *priv = dev_get_drvdata(&pdev->dev);
>>         struct i2s_dai *pri_dai = samsung_i2s_get_pri_dai(&pdev->dev);
>>
>> +       if (!priv)

> This is not obvious. Maybe comment that it is secondary device remove()?

Sure, I will a comment here, I was considering it earlier but somehow it got missed.

>> @@ -1573,6 +1614,9 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
>>                 .name           = "samsung-i2s",
>>                 .driver_data    = (kernel_ulong_t)&i2sv3_dai_type,
>>         },
>> +       {

> Nit - squash with previous line.

Will change it.


-- 
Thanks,
Sylwester
