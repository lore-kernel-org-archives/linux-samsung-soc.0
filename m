Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D6F23BE;
	Thu, 31 Jul 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753971403; cv=none; b=bYmTgehk7Xt8Lp/QjVzNiMvUoNAGydMJaBNOS8bcSEmf9/FakO1kDlrv4K5/0E2Yzir5LDWWGsNnCazUKgyS5LvOYfBA6DN+w+JWnuwCCByZFbuhGKAf0DCsEqzoHno1hlEucaNTBOlsnVzfiueoT/eHv/OSUFGFjWhaJwaDAYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753971403; c=relaxed/simple;
	bh=UW8GLbU03FCsMjccf40Jm+8x7OkSG2Tz5Njj2gbNmQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5Ll36nzUGhH1fBGR+WjfyLu5t4qiJXwtS9S0jVsWgWEMY1DmMY/msJg/KTS6gNGd5ew96sGT5YxzACyGAsN8c/N8+8PDgXx9r5TJhmovBM2DpcrBdd4QyZ+wvO5HdGx0dv379SfQc+r9F/NWirN1FjEznemmZGu+nXM5mVTgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.1.94] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id dee002b7;
	Thu, 31 Jul 2025 17:40:26 +0800 (GMT+08:00)
Message-ID: <5b4dc6a3-f6fd-4bf7-a84e-3d79db8d062e@easystack.cn>
Date: Thu, 31 Jul 2025 17:40:26 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: samsung: exynos-srom: Fix of_iomap leak in
 exynos_srom_probe
To: Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250731083340.1057564-1-zhen.ni@easystack.cn>
 <aa6ad382-dc2a-4f63-be11-7d331027af66@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <aa6ad382-dc2a-4f63-be11-7d331027af66@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985fdab9b90229kunm51918700f3967
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDShkZVkgZHk9NT08aHk8fT1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

Hi,

During static analysis with Smatch, I identified the following issue:

```
drivers/memory/samsung/exynos-srom.c:155 exynos_srom_probe()
warn: 'srom->reg_base' from of_iomap() not released on lines: 155.
```

Problem analysis:
1. In exynos_srom_probe(), the reg_base resource is acquired via of_iomap()
2. The of_platform_populate() call at the end of the function has a 
possible failure path:
```
root = root ? of_node_get(root) : of_find_node_by_path("/");
if (!root)
      return -EINVAL; // Failure return point
```
3. When this path is taken, reg_base is not released, causing a resource 
leak

Verification:
After applying the patch, the Smatch warning is resolved


Best regards,
Zhen


在 2025/7/31 17:06, Krzysztof Kozlowski 写道:
> On 31/07/2025 10:33, Zhen Ni wrote:
>> The current error handling in exynos_srom_probe() has a resource leak
>> in the of_platform_populate() failure path. When this function fails
>> after successful resource allocation, srom->reg_base is not released.
>>
>> To fix this issue, replace of_iomap() with
>> devm_platform_ioremap_resource(). devm_platform_ioremap_resource()
>> is a specialized function for platform devices.
> 
> Don't explain us kernel code. Drop sentence.
> 
>> It allows 'srom->reg_base' to be automatically released whether the
>> probe function succeeds or fails.
> 
> It's obvious.
> 
>>
>> Besides, use IS_ERR() instead of !srom->reg_base
> 
> I don't understand this. You keep explaining the code and this suggests
> you made change here not related to original case. Can you return
> srom->reg_base here? No?
> 
> 
>> as the return value of devm_platform_ioremap_resource()
>> can either be a pointer to the remapped memory or
>> an ERR_PTR() encoded error code if the operation fails.
>>
> 
> Missing fixes and cc-stable.
> 
>> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
>> ---
>>   drivers/memory/samsung/exynos-srom.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
>> index e73dd330af47..d913fb901973 100644
>> --- a/drivers/memory/samsung/exynos-srom.c
>> +++ b/drivers/memory/samsung/exynos-srom.c
>> @@ -121,20 +121,18 @@ static int exynos_srom_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	srom->dev = dev;
>> -	srom->reg_base = of_iomap(np, 0);
>> -	if (!srom->reg_base) {
>> +	srom->reg_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(srom->reg_base)) {
>>   		dev_err(&pdev->dev, "iomap of exynos srom controller failed\n");
>> -		return -ENOMEM;
>> +		return PTR_ERR(srom->reg_base);
> 
> How did you test it?
> 
> Best regards,
> Krzysztof
> 
> 
