Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0F2E8B76;
	Fri, 21 Nov 2025 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763748605; cv=none; b=bZAZBRvAHOCMhq4vnzpMWT5P22drkP/CNwFpGcIwpsrH/2rQbcFltsDVsphYzYg9ZBdvd+8CbyUAwmPecvZbabv/oIInk40a48mrGwNZrQQrdjgEvaJyV5pHaaKPx4KcwPH4r78fnLSEf2TpnUjfHCu9qeAY9OU+NiZ7O60Yb1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763748605; c=relaxed/simple;
	bh=mkuiTzZ8SL8fFa0RSAl00vrBpSOGaNcsPY8EMW5Txfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRqr/GblkuS1zwuzQFRiaMZiZD8BKntwNZucZ6+WXw6M0mxiF5jn1/C4nTR7F5OwrnEfAcP7WiwYfjN+/hB6VmGxPMb5rvpv0cArpldjHWRbQ8+QQyzlEhSTG4D+BHcBpaG1ZDOzNpilE2B1ifAymJvzo283fRxGcTwgwxLrMjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txUDKbto; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txUDKbto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB4BC4CEF1;
	Fri, 21 Nov 2025 18:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763748605;
	bh=mkuiTzZ8SL8fFa0RSAl00vrBpSOGaNcsPY8EMW5Txfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=txUDKbtouIZ/pWXur7/y9LYaZ4KIP+vyFWFDqexLT9o3Vb9E831GZ6/bljwJEfyHH
	 X2XmPQZNQxGrB/kpScXpl/YZYsQcWWFN6V3BybMwLpnbtwXhBeuuGj8Ei6ZtcgkqoY
	 WtQH25WXVaHsmlc5+41rvc57p/3WiPUCWKrqmY9EcGsf6kjKLBoIG3BmfWnwYJGRHJ
	 BBu7JgrD7egT90ERrw5EG3gP4EX/I+SqthpP4Z8AK89kmglWbElD7uikJskJNDyOeR
	 tcuBlX8aJ8QGnqvgE11DbOeY58nxkZrlKQcwr0stUXLS/YSwLv08d/odlDsxE8GALj
	 0vvq5ePE3fIYg==
Message-ID: <bc7b7f86-6e15-44d0-8456-e53a808add83@kernel.org>
Date: Fri, 21 Nov 2025 19:10:01 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
 <20251121-convivial-wren-of-wind-cefe21@kuoka>
 <zgyxb6jqfvfr6iah4lw7rvweextbwxrtlysap4dfzeejqgulwo@ik25opshvwxd>
 <a75675ef-dff6-4f97-854e-a007d289c45d@kernel.org>
 <3phpqlnzbqoclx6zqkqymugzgazg3xtxrmvl3coflgos4ncwf4@ljo4zpgyp7vh>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3phpqlnzbqoclx6zqkqymugzgazg3xtxrmvl3coflgos4ncwf4@ljo4zpgyp7vh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2025 19:07, Lukas Timmermann wrote:
> On Fri, Nov 21, 2025 at 06:24:36PM +0100, Krzysztof Kozlowski wrote:
>> On 21/11/2025 14:45, Lukas Timmermann wrote:
>>> On Fri, Nov 21, 2025 at 10:04:43AM +0100, Krzysztof Kozlowski wrote:
>>>> On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
>>>>> From: Alexandre Marquet <tb@a-marquet.fr>
>>>>>
>>>>> Add the Google Nexus 10 board to documentation.
>>>>>
>>>>> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
>>>>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
>>>>> ---
>>>>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>>>> index f8e20e602c20..97a5a678f43c 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>>>> @@ -120,6 +120,7 @@ properties:
>>>>>                - google,snow-rev5                # Google Snow Rev 5+
>>>>>                - google,spring                   # Google Spring
>>>>>                - insignal,arndale                # Insignal Arndale
>>>>> +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)
>>>>
>>>> Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
>>>> 100% sure that Samsung and Google are two different companies. Google
>>>> products use only google prefixes, see all other Google devices.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> Google sold the device under it's Nexus brand. But it was built by
>>> Samsung, not just it's SoC. It's codename is "manta". Google places it 
>>> in the Samsung directory instead of their own.
>>> See: https://android.googlesource.com/device/samsung/manta/
>>> It is a Samsung board, but also a Google device.
>>
>> As I said, all Google end-user made by Samsung have Google names, not
>> Samsung. Do you see there samsung,spring? Or samsung,nexus for other
>> Nexuses? No.
>>
>> There is just no such thing as samsung,nexus. Never was, so you cannot
>> use that as product.
>>
>> Best regards,
>> Krzysztof
>>
> I compared some Pixel and Nexus devices and now understand what you
> meant. So "google,manta" should be the correct name here?
> As seen in "google,sargo" -> Google Pixel 3a


I don't know what is Manta. If Google calls it code name Manta, can be
Manta. We use code names everywhere and it is fine. But if Google calls
it only Nexus10, should be rather nexus.


Best regards,
Krzysztof
