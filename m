Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092FD4A64C7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784518; cv=none; b=ZeDljqBpeJEFIMhLXckHdf4dpbaXW+bczpAkqDL8XBbhIEf5abR8epZnNyerpxa3xjRselyhmtAJ2ox2VQ1bHjhvSjpG0YJ3k+MmkUpuJkkKeLiI9CkkcLTmzBgRCPb6WJ/P4Xu2H7yBDPp2I4JQXO2oTB2iRWXyeiVsPjIOrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784518; c=relaxed/simple;
	bh=A9KdkE7a/lxrEJYGel6OtN6molxp/6c2X9YNsdc3A0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5NsLFYUrnRTPRKIv4UqRkcHl5vdCeVs9/5ooR7eLVe/DU/XMenjq+krtqtJhEozWbila/nvOGRKzS7wYtrkMond9XH424Faxbkd++UIm/NQxacP/RBPmsJe72NfCXm5+NlMjEnxiCJDv4nEIvPFCDRz4o99xgh8L2UFd9JYfKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V8O7F5sh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=szHRhVa+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V8O7F5sh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="szHRhVa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788784516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
	b=V8O7F5shShFpzHOrRFONjfyXJbcog/aA+RRKsV0AONWLbmwwnrYPz9odANHPYw/PDpqWcj
	DAXf9NchLU0+vNDtHgan3ffCSsnml5WH0eD4VL+K8YaHtoG+XmEFPHcT1uiAj8npTipWnw
	K5vT+cJqQUJ0EC6AOabisSRnL5VRujs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-F70C5KgJOtCEMBVuGbbXBQ-1; Mon, 07 Sep 2026 08:35:13 -0400
X-MC-Unique: F70C5KgJOtCEMBVuGbbXBQ-1
X-Mimecast-MFC-AGG-ID: F70C5KgJOtCEMBVuGbbXBQ_1788784512
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48439ef42d8so2905004f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Sep 2026 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788784511; x=1789389311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
        b=szHRhVa+oZGq1AGkSb3N579xFMMRPoNi3MfATN9eUvlmY6ypQ9OjVWerGCEhUwB39U
         68UnWtxW3XF86KkrIASw2h6mWJqAtGIXHHTBjJRM+qJmC3A853MOsqltIaxIjpW3CFqP
         GXu+IKHOlq5nP0i3RXQeoY4GSMcxjgzaIcj+DA8l2jslS6ux1z8R9nDDZf91BbJjjWfj
         gKe18bJ3Zf7S4ViIWxs/PxeLUF9IE5mW3Om1m0ZgNQnpufbxa6b6y+QOR/c2lWNj3gfb
         0aF04Ho+2NL2JkOHIBvQ2P90YzaRuy6gn9ZPx2avyzlnW67ESWlJPFijhhEyZOEGWP4z
         leEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784511; x=1789389311;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
        b=knPWfFoQYcyNFFo2iqggKwyStwLNjuHw8x1cZe/9Zhb5lOK1qBbGwJ6VneTOePh3E9
         Iz3KClpe2KIAEaIlgMW2SPgZPHXepM4CP/2E6L6ZVEjIw7EqSJNikEGDpLPbWaUw0bgJ
         fxZmZVSo9YN3+YNTMWxp2+EVuVA3OmLMl6Nu8tdr+LxlL3+t0IXOJKUVp2CFWQJLoTq6
         N9H60DvqjkEuKgGNQGnb1hj8QEgwsSJneubdmzeEE1fwEtE8ymPcO7o2vkVmkppxjf+S
         ybmc+M7SS/+5CnpQsrbBK1H8qCAjStzWRpX1uR0HKbDag2nlB1D/vBrN/25n5yb2qonk
         FYjg==
X-Forwarded-Encrypted: i=1; AKwUvBwc54ihztd38LnbxiCw+uCkqn90J5NyRCbi+TZFqr/gzmmmHhO3vxttc/VlCKdkuelrb2MX9A80t3KcdZgQLSmzeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mzyOlGkN3ALmjLYdO82xg3LiI3sj129g81RK2+AvYYTDqSLoDS
	EOHpKeMAtuvwQ6ocKafJXtjEjbM6Df9NUPsLSI63RrdmY2Y+IoIpbuz2z5tMC0Iapw60+VYgjgw
	gOc6o7R9GDmqWdQfX3s/5cRL94a5p6Po2gA2zfqPCEvoZBT1j4KoOVAT69O7UWRkhGFRTX+to
X-Gm-Gg: AYBFou3qYbioXgtoZDOJLo9s2uLNqg2WArCslhwRmbPvW0DQ0VdrHIiQWS7x8reYwEY
	Xc1y9pcLW4ML+eoLq257biP9qP5AA+VpOjtCZtGt+fAlfNFibFF+oRLm8xEC2vNy+DQq5BJqD4x
	uFdjbnzMvuoo57V71J9iafKGgQKKQhNfaU5nt3RpAWN/EvyOGvejW91JjqhwGuQBSv8GXJVNDjG
	bMbyv9ngEXJKYHEjwdj/6JeWPetqsEJVpP7myZF2WT9OiUe3BaSlghadvH2wW7isIKvrd/TumYF
	SLTKYIrr21NnsCEtoEP2yC6q17H1ppQg4SqXNU0MGPwweZ7fmrJgW27ClADO60E+shLT5+AB
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr21064091f8f.36.1788784511674;
        Mon, 07 Sep 2026 05:35:11 -0700 (PDT)
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr21064046f8f.36.1788784511253;
        Mon, 07 Sep 2026 05:35:11 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm29439360f8f.34.2026.09.07.05.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:35:10 -0700 (PDT)
Message-ID: <400323d4-cdb8-40ff-b23b-d426a0d7e6e8@redhat.com>
Date: Mon, 7 Sep 2026 14:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 George Cherian <gcherian@marvell.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Ayush Sawal
 <ayush.sawal@chelsio.com>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20260904114345.27509-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20260904114345.27509-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2026 13.43, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/crypto/atmel-sha.c                       |  4 ++--
>   drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
>   drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
>   drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
>   drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
>   drivers/crypto/ccp/ccp-dev.c                     |  2 +-
>   drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
>   drivers/crypto/chelsio/chcr_algo.c               |  2 +-
>   drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
>   drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
>   drivers/crypto/omap-sham.c                       |  4 ++--
>   drivers/crypto/qce/aead.c                        |  2 +-
>   drivers/crypto/s5p-sss.c                         |  2 +-
>   13 files changed, 24 insertions(+), 24 deletions(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>

