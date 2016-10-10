From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] ASoC: samsung: Minor simplification in i2s_set_fmt()
Date: Mon, 10 Oct 2016 19:18:58 +0200
Message-ID: <57FBCD82.8000509@math.uni-bielefeld.de>
References: <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20161010170528.GB3352@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:36335 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752526AbcJJRUD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 13:20:03 -0400
In-Reply-To: <20161010170528.GB3352@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com, Michael McConville <mmcco@mykolab.com>

Hello Krzysztof,


Krzysztof Kozlowski wrote:
> On Mon, Oct 10, 2016 at 04:04:05AM +0200, Tobias Jakobi wrote:
>> From: Michael McConville <mmcco@mykolab.com>
>>
>> We can replace the if-statement with the simpler bit
>> toggle operation.
>>
>> Changes in v2:
>> - add proper commit header and description
>>
>> Signed-off-by: Michael McConville <mmcco@mykolab.com>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
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
> 
> It is late, full day of work... so I might be thinking slowly... but
> this does not look like proper replacement. Unless for specific values
> used in the driver this works? From mathematical point of view, imagine
> tmp=6 abd lrp_rlow=3.
> 
> This is not equal...
> 
> But... maybe it is late... :)
No, you're correct, this obviously only works for lrp_rlow of the type
(1 << n). For arbitrary values this transformation isn't equivalent. But
it applies here.

Anyway, please drop this if you think it is misleading. I just found it
while cleaning my inbox.

- Tobias




> 
> Krzysztof
> 
