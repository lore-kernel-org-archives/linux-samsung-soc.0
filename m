Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0C3FD4;
	Wed, 21 Aug 2024 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210398; cv=none; b=MEOZh/G5iobPh/ZX7dDH9mJajmaRemgCF2MWl/H1VRZ8Jqed0pjtbzzemd4E7iI9gXEgPwKyxdeqewGJHAkQTas5eEmnpz4xTE+6XVM7o+YkDZMQuuo/U/oe9yiWM8tG6cSK5dpK6bOyDSoR5u2AZAS1h6g00sGhtT+lY13DVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210398; c=relaxed/simple;
	bh=ekc4UKG/naBvDE7oIUAwIWugkmXwGjS/9YxfRmEW5/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n5w342UT1hPj3o+TOSqs1H8AJYB70NkKc804X3YxPWmf/T/SHi/v87mwjVGsiaTZyXk7+TcUc4m92iwarbzxYGF3uU7etxYHZ9Bp86V7yKK7e52CZD0G8n3ThF9yDH6a+rDCXGpPd4N36bsTFZ1FQ/Hh5YkxNehSrFPDT/7ZyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WpWm618MCz1j6jw;
	Wed, 21 Aug 2024 11:19:50 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id D75211400CA;
	Wed, 21 Aug 2024 11:19:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Aug 2024 11:19:51 +0800
Message-ID: <83c57ee0-b1e4-7232-ac74-e910b5db12a5@huawei.com>
Date: Wed, 21 Aug 2024 11:19:50 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next RESEND] usb: xhci: Simplify with scoped for each OF
 child loop
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
CC: <gregkh@linuxfoundation.org>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20240820065635.560427-1-ruanjinjie@huawei.com>
 <435bde54-aa08-47d1-8fe0-980bcc577803@rowland.harvard.edu>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <435bde54-aa08-47d1-8fe0-980bcc577803@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/20 21:46, Alan Stern wrote:
> On Tue, Aug 20, 2024 at 02:56:35PM +0800, Jinjie Ruan wrote:
>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>> device nodes to make code a bit simpler.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/usb/host/ehci-exynos.c | 9 ++-------
>>  drivers/usb/host/ohci-exynos.c | 9 ++-------
>>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> The patch changes ehci-exynos.c and ohci-exynos.c.  So then why does the 
> Subject: line say "xhci"?

git log --oneline drivers/usb/host/* shows this subject a lot, so adopt it.

> 
> The contents of the patch look okay.
> 
> Alan Stern
> 
>> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
>> index f40bc2a7a124..e3a961d3f5fc 100644
>> --- a/drivers/usb/host/ehci-exynos.c
>> +++ b/drivers/usb/host/ehci-exynos.c
>> @@ -48,7 +48,6 @@ struct exynos_ehci_hcd {
>>  static int exynos_ehci_get_phy(struct device *dev,
>>  				struct exynos_ehci_hcd *exynos_ehci)
>>  {
>> -	struct device_node *child;
>>  	struct phy *phy;
>>  	int phy_number, num_phys;
>>  	int ret;
>> @@ -66,26 +65,22 @@ static int exynos_ehci_get_phy(struct device *dev,
>>  		return 0;
>>  
>>  	/* Get PHYs using legacy bindings */
>> -	for_each_available_child_of_node(dev->of_node, child) {
>> +	for_each_available_child_of_node_scoped(dev->of_node, child) {
>>  		ret = of_property_read_u32(child, "reg", &phy_number);
>>  		if (ret) {
>>  			dev_err(dev, "Failed to parse device tree\n");
>> -			of_node_put(child);
>>  			return ret;
>>  		}
>>  
>>  		if (phy_number >= PHY_NUMBER) {
>>  			dev_err(dev, "Invalid number of PHYs\n");
>> -			of_node_put(child);
>>  			return -EINVAL;
>>  		}
>>  
>>  		phy = devm_of_phy_optional_get(dev, child, NULL);
>>  		exynos_ehci->phy[phy_number] = phy;
>> -		if (IS_ERR(phy)) {
>> -			of_node_put(child);
>> +		if (IS_ERR(phy))
>>  			return PTR_ERR(phy);
>> -		}
>>  	}
>>  
>>  	exynos_ehci->legacy_phy = true;
>> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
>> index bfa2eba4e3a7..1379e03644b2 100644
>> --- a/drivers/usb/host/ohci-exynos.c
>> +++ b/drivers/usb/host/ohci-exynos.c
>> @@ -37,7 +37,6 @@ struct exynos_ohci_hcd {
>>  static int exynos_ohci_get_phy(struct device *dev,
>>  				struct exynos_ohci_hcd *exynos_ohci)
>>  {
>> -	struct device_node *child;
>>  	struct phy *phy;
>>  	int phy_number, num_phys;
>>  	int ret;
>> @@ -55,26 +54,22 @@ static int exynos_ohci_get_phy(struct device *dev,
>>  		return 0;
>>  
>>  	/* Get PHYs using legacy bindings */
>> -	for_each_available_child_of_node(dev->of_node, child) {
>> +	for_each_available_child_of_node_scoped(dev->of_node, child) {
>>  		ret = of_property_read_u32(child, "reg", &phy_number);
>>  		if (ret) {
>>  			dev_err(dev, "Failed to parse device tree\n");
>> -			of_node_put(child);
>>  			return ret;
>>  		}
>>  
>>  		if (phy_number >= PHY_NUMBER) {
>>  			dev_err(dev, "Invalid number of PHYs\n");
>> -			of_node_put(child);
>>  			return -EINVAL;
>>  		}
>>  
>>  		phy = devm_of_phy_optional_get(dev, child, NULL);
>>  		exynos_ohci->phy[phy_number] = phy;
>> -		if (IS_ERR(phy)) {
>> -			of_node_put(child);
>> +		if (IS_ERR(phy))
>>  			return PTR_ERR(phy);
>> -		}
>>  	}
>>  
>>  	exynos_ohci->legacy_phy = true;
>> -- 
>> 2.34.1
>>
