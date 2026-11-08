Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158653;
	b=kxRyAhb4Qatdqx5T4FyBoRgyM8IfrqSjVKy3Q///qC2I6mOMGKXB3g0XwL/xoBlaHnHS
	 iSQreakMc096lQug+nckQ5Lnr0EBxtKWIXJRxWu3sDK4sBa5q9sIvvFgsTinhCsPk2BoD
	 n/A3BR1SZx5cbV1Mv8k+WnRI6EEHx4HMg9Y6ZeiP9hxE0cEFcEvMoLkDo+CmhZbN4KUEP
	 VM9zjCKH+R9YZg+DF2K4BUWRsOVOLiRHwRmaM9MZtkqb5uyodZA9TcfiBisx7/nwwSxHa
	 HaxtFBYBs78+nX0lkQTcmXmRivuVHRMjwLibL5PSy7zu17InV/86USRSGWWr208KbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158653;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YXcaywW82/OwTpJaNMPSCSwp6PL1lwbEbYBT4RlUze8=;
	b=LZY94SA5tc4UnaQnlYS4WQqX05/qs2K91G7BJyRAWEddADEdFRwBnKTmB/5PkSLVLfMW
	 7HFTa/kACloTYUTkdasmXb/T6zRfVNr82V/fs48m/DDhtVNvzswHhY2e5XE90mg96A84Y
	 93FL0HJlUQ8rWiHWtpyK5O6klHexWAucZ8H5F59kP9zxXzGQBw+AxW/MmzbxtoDILF+Ox
	 VP+TLqM9pcot0zY66SlKoVd4LTlCQDruTR2teYqVLNo4lBuJudBAjsdRKQ7UEbzmcfdi9
	 cOvR0Pq5ugQ4Hbl4qDow83D6ScyorHsXYvXt01bD9ZMFr3m/jtqeNVQmEMAVywSqFVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="QYInMVi/";
	arc=none smtp.remote-ip=203.205.221.242
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B5606A321;
	Sun,  8 Nov 2026 17:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QYInMVi/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158649; bh=YXcaywW82/OwTpJaNMPSCSwp6PL1lwbEbYBT4RlUze8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QYInMVi/0IJ1xu5rrNkVRE0OGi6yLvtYPJ6uCGl7kG2mtNeKpyBZ/QfgDQPTfHsJz
	 FcwTA4LzCXyDgb//nV8IPY5XqIuPc0+LMVLJ898o2ALjbACJ9Msll/ds9F/H//gufu
	 KzgxmRyLlnXUPTQDUf5X1vCpho5xrd51bUaXxhnQ=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158646t9xll2mry
Message-ID: <tencent_B3A6FAF92249C8215D13A70D408EDFE8CA07@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5boNCQzmaUwllHI1wfo8Ka7ClInv3/51fNUUapbjuYbgYfimhjB
	 GUM0w0uBpzA3xogDudQnRqcQwUSnZLnPXyueFgW+Bk1cZClF130458+FudhE6OmjNNhHlrQxg29I
	 sBlna+vVU1LiH576UI1cNiNQqctkhQ5dG98tYFPuJTMeQCpuqyBwthR2b6uCQJloHhtHhjvAL49L
	 9hjUYhluCcbu0noSSeWwnbj6uC3i264xv7iILWEhhhEpCaQQRWejdpMsupN/jK9I1qKtPrJjzlZM
	 84o8dq9x57v5/UpEuFnBhUcCDLrBHM0HZlSvWEebvEkQsz0TasXLzSb5MmjBs/KnHOaeCNIyJp7n
	 zZTLeJOYpXUTZ+ff8XlSdrW8k42usYbqEwq0zx4UsMoxzIMT5WNN+MQLJnV0BcwiA8Om5aQzOx0o
	 M1tfPH36gDSWqEKIEaaJrLRFmRbq76dBzhiFvXuw0I5Cl+tUjHUmbLfOw/tGwydPRMEDbVD4QdjK
	 fRdenc+39X3wNwEarJ0wqZbzlbUMuXp0S19kk3ODJFeIQHGjgFf1WMgpqRDWnGX8wiye+5cVC8YM
	 wbsQ9wGN7app4n1XTC4f9/0rrYy9+7tWKE1jKuSquEJlOwXqfw0yLeZflXnjZPV3XtJ8EC+s6pVg
	 LZq0OAw2qwa6ay3djQgnyJ0jzHCniXXod/alnGr1L0AAGNQ0ikgeseA3japcYL7XecNk8hEx+XrG
	 TU0PtSeRTecYS0r9W+xKw39QU0y5KoVAFh2dIWo3K4eyxBZtlOHDisCm+reJqkZEI6WSufNtPRhu
	 MPfZS03slI65W06sszj06jbKan2qMKRuwUhqmYlUKHVe9E9Mvwv41mpFADzFjHgvvhvg8It9rc74
	 AJEcEn8KI8QGUSg95Slygki6eBzjPesog85VxWl+PPItUC6JAtDaM351BPoq7bcOZtbQr/L3Z/Ds
	 q6T2hSDMB8UToYfeZ1LQuNONOBLervkon6vCjNqJkhL+AxHmbcRYZIpKv58kIwpBzdqQFexgINCc
	 6dzQE1qO4cYmT3AjIZyV2o3uducA0abi8HcNLFct0SDFwe2S53
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Jiawen Liu <1298662399@qq.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] i2c: i2c-s3c2410: fix runtime PM cleanup
In-Reply-To: <aoRq_1DgSUrmR_i_@zenone.zhora.eu>
References: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com> <aoRq_1DgSUrmR_i_@zenone.zhora.eu>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853265.5.8299501898122494056@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andi,

Thanks for the suggested wording and tags. The proposed ordering works for me.

One detail: the driver keeps the clock prepared and enables it for each
transfer. Could the description say "keeping the clock prepared until
adapter teardown is complete"? This preserves the prepare reference for
transfers that a client may perform during removal.

Please also add the proposed Fixes and Cc: stable tags. I'll use my full
name, Jiawen Liu, in future Signed-off-by lines.

Thanks,
Jiawen

