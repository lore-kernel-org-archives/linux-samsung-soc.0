Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAB313EFE3;
	Sat,  8 Feb 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739028697; cv=none; b=f+2+aMxoFj+N09I1Nz4RzA3qoPFAXodPaVuX9rGw1oinwSKp6n/d+ptL+APbndolpSBZKDXaC9eJZccbJMVntJ2ywdWWtw8eTQ8H96K6TukYxat0h0ezSkVbuW06M9PLg09dco41TN3Z8H1d7Q6w0IfjWEsV8G1ALlKeWoUNotI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739028697; c=relaxed/simple;
	bh=xUEyeDJYNR6Ucl+LArrtXhSHez6IpDdlM3WRuVS2+go=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=d4wDXCTJ41JaNm4vcIh5HOinGSDn0JX+75SHvvuQirTsjhsTlh1Y0CCJNIDkLen87MoX+If4y28sQHLTfUAiERWFdfip3WEDGVq4Y/7fbrTHPvYW1Sycn3gq2d0jLl5uoVHyntmspGmeqD7kIvL5lRjol+QMwgVh5VZWIfsYJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OTJYcSmQ; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OTJYcSmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739028668; x=1739633468; i=markus.elfring@web.de;
	bh=7smLfTFL5BKYAZQkazi7scNRCK0L6bFwsDahCQSasH4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OTJYcSmQXnJ28ne+zJmF6sLLBOptrLx32EOeU3FkEeHE/fASP5Eox2XGtb7+ncld
	 yQSdqQOgj6SstGmXeXNKCCdcUfhnTxqb8IO4bigyzGKGJp0VaU7JOcCXVOKDQzt6g
	 1dlBhC+zk6V3a+bVfvQyNRSqYEtwLMVoL8bBBrMnqZBr8QYseV/bhicAbvOGCpQ8d
	 MDcTGiBtJjEqSk2Uk4AsQb8mQNO+BHJTs/nAeZwRVCMMh4qCr6c2RnQrPOXgEKSi1
	 bOq2iXySPtsuAskQ2tJLbD3P36vJoJhblc/tSnrHw+iJwt5xeNsj6vV8L7RqNlcRu
	 SBy/6spmRo0tjdoX+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLRUX-1txUjf1q67-00TWna; Sat, 08
 Feb 2025 16:31:08 +0100
Message-ID: <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Date: Sat, 8 Feb 2025 16:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tudor Ambarus <tudor.ambarus@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:41VPE8YHUwhgvBJ+GjhA+69xcvqt1/dXMka1JYXhGwdWO2uxU0+
 7/tUEhDlca6pJpreqOxT0yc/2G/pKFSQk8NqsO5zPkOwc4nOZXKtDDL69ehUZu0GpAS81OU
 39aVyHgvoCaT4xVlWeAtznFQTeDWQTehi/JwsFJUoLHGcrnkRVilv49G07dM7mLxhlhmWIF
 +3qOlG8VmFmL3NQOo14qA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+Z9MQ63j70M=;uZzfcpFuhUOZtbmhzft5U8Jbey4
 oW3o5TdOkWPhufzVXoEqHrHgOXYQ8NpDuKZb4xpCXgiS6Qyo4AuvUCgTe7BZbVu4WAi4N/JH0
 zGr+STweUFR1vfLD1QhQHFMITyWEwOVUpgMFVTXMpaMQ64mbr4vm8s8izDP6pzSCR1O5NhQwV
 AK4b8btFxk9umsrQ0/npcAH/y5gTeSMUm8Xg27MhXrMR2JoJ7Bg98sYuF+lXU/Lg8Dn4WbmQu
 9kv5wBwWDa2VuDvPr5VtqWvIQGmyUBrqeNbwQeRmfk4jVYhpFpWeOhiuE5C0bzxPbEL8eJbj6
 8xzl/LwSeSNqDltqHg3ypRCSYCEOHKKSj8Q/Im3KE7QIaw5+tx4J+bg4PexXvv45pEuVKKrCp
 +tGvJj0oJt90uCAyZEmLe4b18AeMBj9swUVTNGccuhLRpZyvX2LGZroc0TxPjSER5c5ekYjxP
 LtNsMmEPP9312NhQc2Hc+VpErdKURktZ5ExFWlkFoSFKXjTcfNgsWFBqcE7C3sXQtyFskYrKq
 Bs6Jcu8NJWrZuu6qefCMkXMHrUgbEg+lyLGNg7v9/zUnZJPftE97bC3CQYqH81R2GAc9FzE4/
 bY1q0TAat7MiBJIL0MMv1/4fvXM69Lkh34TmaDPzNemx39PpiNGeCF6id+bD0s6ua7TAGUeOR
 84nDWnnhRap3ZD06RhIQQALB5bgkWA675BjFZrPR0kZl4pxtJcbTrCC4zfbMCeVOTwH/cqxZd
 C0ebnUnggHraL7/ayhiDebCZhmAc5MdWs63W4amaTV54WRUyHM6p8GfLzaw/8FxtZjvS0SQLR
 d2g6drU5YREC0PJnlfvSgB8Onne5cnINZFr4t7TKqPSzZ3YHjICz3qb9JT5MXPRrkJzBRfyYu
 psXOvWzMkXFHGz/SNa5J6f76smmSwDOlruZOrIopD+AENAAfbpmHSvh5zqNQtmTDUfseI2KWa
 3zNCPBdwsawfyxNXPk2a755BNZZjzrvEsLye9EXdllqhVJtQCY2CLgd24foxFwyWDumZ6UYM2
 ieLaAmbfHVwAiNTWJC8Gq/RmbBFM9qnmhRkoXYbaeg5gU5xJqKmsEPPsUesXyXMacp2m2PZ4b
 ab8mzmhmaYTxDjzw5nTlg6spCC16Kq8l+NR6LRZsBZrA6VdW5z1jMR1BYpjnqCgriMIKuvNdP
 J5lL8/sjouxpw4+2eOIHUXjxAoee+6DKC1A9BYNCRuwuFDPkE5VbJuS9QPZQ62TXJBS3Pyxsk
 WZ5PPQxbgGDHfzh7p0tNbIHclpu/M/suXyG8m3MrnGPodUSHHT8XP+88JbDVilxTAv9ek1Ws6
 wJ6sua0IP8dbmq/ZnnyihOJuA71AB0fDvrxJou7h4spXl5S1R55LV9BJYK+B8OxU+EeRifYXV
 Xggs3O4ztBhwqsWXygWmLH90ptIRKVbmYQTkZZhyDkA9BVwIinOHhs75tosNloZrGp55rp87A
 NZmER3mT0QMIGakfNHiH4dgDRVHI=

=E2=80=A6
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -0,0 +1,771 @@
=E2=80=A6
> +static int acpm_dequeue_by_polling(struct acpm_chan *achan,
> +				   const struct acpm_xfer *xfer)
> +{
=E2=80=A6
> +	do {
> +		mutex_lock(&achan->rx_lock);
> +		ret =3D acpm_get_rx(achan, xfer);
> +		mutex_unlock(&achan->rx_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&achan->rx_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/mutex.h#L201

Regards,
Markus
