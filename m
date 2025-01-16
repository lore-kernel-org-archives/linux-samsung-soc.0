Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062841DE2B8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737027048; cv=none; b=BVHTuqidACM+k+0h69mC7OdBUMcp8H5izghoylr9eccaynE/Ad/oeOJAQ2NH3byYlSv2N1bls3FDNVmRh1mG/x5KOdUraC7Tgt8Fr5g/1CuqHpVtGgIndXRoRN4XB11JXzs3LMRtw3ubATx2nrT30VNVN2NC1DZZSoOc1rjTdng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737027048; c=relaxed/simple;
	bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U4ypsAIFb7TH8segbQEjZbazCnW/1lZb6PNCg4Q8J3vQ7h4dRxWoiHjFj6T6d7N3zkMjWjOwr87W1dzuDcVZlzAQdGa+GDFI8Q5axnpD1wklMHkbRyQhdTc0m8KqHJ502z5AQeNuWBJbpUGD7bl0+VOEMBHhrGV4iSr2FKOC3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S5PRRw1E; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S5PRRw1E"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e06af753so435071f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 03:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737027045; x=1737631845; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
        b=S5PRRw1En8G+21KOJC9ZD6IqUHXgz4xQLsvIBxr/XWZPdIgRHRo/eicNlgEHSbm1kb
         1GSs0FuwZkJWhSTbI8sRnjw4lqGhGVOHWmzZ0yxkZ199QjpJ48qSkyfwlh0J7t2cDH16
         5O+UvF7PGwbTxzl8xtZQjUu2yIhdNvIjWZaX7uFfOqe4w24yiEAkdt1+OoG+UHZ0ii6u
         4l9rBpEwm0MJgnEvnBvLGqAb2KXZ1W7WasebdcT1tz8uneIWS4mZcpNqQUbB3A6WCvIU
         VaO0n04kdHOCGitjn0dYqnYnHbSiJdKfZFG5DzRhNNd9oYOuRAVQuWsx2j0NfW/la/bm
         m4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737027045; x=1737631845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
        b=dqIh0YveyL80UIg/WZIKm0Ao5GDaXkSz9Wy3gvONjTuvHoBi3fLP113hKk3oKus2HU
         eXP+uS0IZjrSU7FB8s0jzFo45O2YkQJB8edJhNU3jfSMnq1ud15f9rVMgY7R3B5C2/QF
         1abH/Ut3wbguR6NiIQw7tRhvAg8hn2mbAEdu3Q3QnBvyW2KEHDscU2CATcHcBXarYOw3
         AgN1ea7rDyaqJb5M2bstHSy9FqoOSImRlcso7H8wyLdmJS6xdfhnBvu+lFUGkwARzahU
         70ADqBK5QWIW9D1GCGbncyuUa2z+9R41ngeyK5JalotWhejEmaJVf5oMiUYlKqJoiY9e
         uqnA==
X-Forwarded-Encrypted: i=1; AJvYcCU3aWFmHeVNfOwr9uGTHM1497yM9kDnaSD1GO4KBBEjdHU7fPlI2STFzEKHGbW0hWeFzJukQCXsj84bu8gSCe/tlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ZSLQFK9Hk5H2qBTJqGWYiaS5rzkssjMfBBXSHVGt1GoIZXn7
	lTDO0AjTB77ZYyggBah0SAKv26wIv0cYCLmGNrcwW0rjCB8h166T9b20IU5P5Ww=
X-Gm-Gg: ASbGncveDpF2j2KldeekebZfNXRFqnDuIWM0amMXDEtQU35SqYR2GTkoHPxE26Gvs2Q
	ztDdfUnBB1m93gDbuRjwIHq2G5wACKuoQAa9MepBAdLaxXtNagblxnwB9Zoy5TAMhMuXlHJzmPc
	7t1NYGBjln0NCa3nujP+LDAHDiSoIbMG9oQddz4zx9+t86GbOkxbBsXIg4cv2hDqiW9817PeywG
	TiQDirYhhxndXnbVctivDcF5m9AS5tgcINXxcaOC9mrD7QYV6FBWbzDa5GUvw==
X-Google-Smtp-Source: AGHT+IGsW7R8SXZiI21rLVry2LB3/IZkmamq2Z2hj3KPYHeT5ENtm5n56n32F1wCYQ4Tz4sR0OmrNQ==
X-Received: by 2002:a5d:648b:0:b0:386:3e3c:ef1 with SMTP id ffacd0b85a97d-38a87312f36mr34852486f8f.35.1737027045345;
        Thu, 16 Jan 2025 03:30:45 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac707sm55516355e9.15.2025.01.16.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:30:44 -0800 (PST)
Message-ID: <941c7920a7d07496222e6e93cb338ca6df38dc33.camel@linaro.org>
Subject: Re: [PATCH v3] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Mike Snitzer <snitzer@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,  Eric
 Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Thu, 16 Jan 2025 11:30:43 +0000
In-Reply-To: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
References: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-16 at 11:18 +0000, Andr=C3=A9 Draszik wrote:
> Changes in v2:
> - completely new approach using devres action for Scsi_host cleanup, to
> =C2=A0 ensure ordering

Just repeating this again due to updated recipients list:

This new approach now means that Scsi_host cleanup (scsi_host_put)
happens after ufshcd's hba->dev cleanup and I am not sure if this
approach has wider implications (in particular if there is any
underlying assumption or requirement for the Scsi_host device to
clean up before the ufshcd device).

Simple testing using a few iteration of manual module bind/unbind
worked, as did the error handling / cleanup during init. But I'm
not sure if that is sufficient testing for the changed release
ordering.

Cheers,
Andre'

