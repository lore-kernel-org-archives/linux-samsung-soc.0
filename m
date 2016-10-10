From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] ASoC: samsung: Minor simplification in i2s_set_fmt()
Date: Mon, 10 Oct 2016 11:06:35 +0200
Message-ID: <57FB5A1B.1000900@math.uni-bielefeld.de>
References: <CGME20161010020438eucas1p2f24f4419a03de8df4bbd1156d859e1d0@eucas1p2.samsung.com>
 <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <8e01225b-3418-cb53-4bf4-8ef15f553577@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:35322 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750717AbcJJJGr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 05:06:47 -0400
In-Reply-To: <8e01225b-3418-cb53-4bf4-8ef15f553577@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, krzk@kernel.org, Michael McConville <mmcco@mykolab.com>

Hello,


Sylwester Nawrocki wrote:
> On 10/10/2016 04:04 AM, Tobias Jakobi wrote:
>> From: Michael McConville <mmcco@mykolab.com>
>>
>> We can replace the if-statement with the simpler bit
>> toggle operation.
> 
>> Changes in v2:
>> - add proper commit header and description
> 
> Thanks for the patch. The above 2 lines should be moved past the
> scissors "---" line below.
should I resend, or can this be fixed on merge?

- Tobias


>> Signed-off-by: Michael McConville <mmcco@mykolab.com>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
>> ---
> 
>>  sound/soc/samsung/i2s.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
>> index 50635ee..1c484ac 100644
>> --- a/sound/soc/samsung/i2s.c
>> +++ b/sound/soc/samsung/i2s.c
>> @@ -627,10 +627,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
>>  	case SND_SOC_DAIFMT_NB_NF:
>>  		break;
>>  	case SND_SOC_DAIFMT_NB_IF:
>> -		if (tmp & lrp_rlow)
>> -			tmp &= ~lrp_rlow;
>> -		else
>> -			tmp |= lrp_rlow;
>> +		tmp ^= lrp_rlow;
>>  		break;
>>  	default:
>>  		dev_err(&i2s->pdev->dev, "Polarity not supported\n");
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
