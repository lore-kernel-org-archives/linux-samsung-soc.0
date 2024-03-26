Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15EB481DE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711451586; cv=none; b=fZcKSRLPZKCDf2YVacllStZXuZiqYKQ3QU+VmZ+oUKQyK1rv7/8R9Ynh6ZW6x1+5FaY2Av1iP98t5sLsSeAAqMOtrRR85oLKkF1q6UUwVCLO5S0hwo9I8VUs5TqfJFvPZufUSh0h639wNnLFeCFufT61Z061XUP1HD6+NXfd7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711451586; c=relaxed/simple;
	bh=obuHcm/3xdOzAnj87UVbyqU27DBpx+x5xHMGLWBzQIs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eGYwanCMRTnhpvn3tFFbtPDxRBkU4lcuADAFlAJeV1mVscU+J/tnaxeZOD40tcaBtuQUy/9q/jh8VUKLvszXzfEVZ489M8+bhYnxlXVtYKLKDEMsk1O0I7K0H+RJdLqUGCa6/QiYTL4kIPrto6JnNM/hw3vJranwV/QP8cfqPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWzFEIh6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWzFEIh6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-341808b6217so3407643f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 04:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711451583; x=1712056383; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=obuHcm/3xdOzAnj87UVbyqU27DBpx+x5xHMGLWBzQIs=;
        b=QWzFEIh6i8GZqoN++S2BWJG/xse+ekUgLf8c7ohCtExEQv5UWZ034M6KcFbK2Y7DBI
         SRv31gE/+k6XJaE+KyNMsK2o9Pq9lHkUPpGxhA8O3gb+Ij/1tr/YZ7xI0KDT4UTdQAnw
         +pKOyaSA6AYjOCvq1jACSTjk2sQ7+WPNDq34nQyP18J/c9WVBXhEWbkWikBm1WaW8Zh6
         c62TRWtVONILJVbyuTM/EJJrLJaFmfbnfl7ACcjbqLi+Na7gkw+5RwYz77ST6G0hI3Wr
         M8QWiL24Opl5lLoMJhaU583mbhXVfpltjcY2iv+kznXyR8XeYETJ7mhhUmHYjvuLOUhD
         qENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711451583; x=1712056383;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obuHcm/3xdOzAnj87UVbyqU27DBpx+x5xHMGLWBzQIs=;
        b=ZjE7x7S2Jus7z0A1iXz/FzZYzFX6VRZ7uKdAignnDT8Xd9A2lx+Xqn8TRGULPirl0t
         pZHEdlhVqSqIK/8Zob3MlVyBhVO86fsCVXJD9JatzLlcKtkgZEH3z1kKgJ3wBCc86WEi
         UE9lweYA+CF00N6Mn2aHHqNcH22nFzcAMgkzVh6KbI7ltreOsRtazjg2lX112EN1G4QU
         jB/F2A5JV8+ainHQNSDUAam9teq7U2BrENFmUmbAI2HjbBSfwAamWVkdWv9Gv0Ua1MeT
         H+WqCijzd0Pqsxq6DYtOu2qOzD6cTRwFEQ7zs0jp7i8ll82Kcw3Rwkx7hIeL+sa65H/7
         6EwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxi32X4jwDC52Vt4i+mxh/1FTN/VaGrOR7DvpQ+G4WzInUmAeqes0V7PKGT/hiKq2fjIjzvh9kCZ+0JcfuyP0M9cmFzy1yvEbIQa2c4DHOyhs=
X-Gm-Message-State: AOJu0YxCYx4nfqLFn2VjZLfBUj+/jsnCTv/drBb65DZgRUPOqgXVi0BZ
	9FytoaQX1c/XRYAD3BZVMaUxroKTbHowbpWGH7T2ybN5RJA0l+wk9HlApMlxfiw=
X-Google-Smtp-Source: AGHT+IGbgs8epz50aPlOWQHVksIvzA+lR3GutAL2nVRw5PemwOzalG1PtcF/Y6WO7R4P8gZsBDXvHQ==
X-Received: by 2002:a5d:4e8c:0:b0:33e:6d6c:8503 with SMTP id e12-20020a5d4e8c000000b0033e6d6c8503mr6765943wru.16.1711451583172;
        Tue, 26 Mar 2024 04:13:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d51ce000000b0033e9fca1e49sm11869966wrv.60.2024.03.26.04.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 04:13:02 -0700 (PDT)
Message-ID: <9f2c715e671de0c083355bfbece703936e14045a.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101: order pinctrl-* props
 alphabetically
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, willmcvicker@google.com,
 kernel-team@android.com
Date: Tue, 26 Mar 2024 11:13:01 +0000
In-Reply-To: <20240326103620.298298-3-tudor.ambarus@linaro.org>
References: <20240326103620.298298-1-tudor.ambarus@linaro.org>
	 <20240326103620.298298-3-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Tue, 2024-03-26 at 10:36 +0000, Tudor Ambarus wrote:
> Reverse pinctrl-* lines, first pinctrl-0 then pinctrl-names. Move the
> pinctrl-* properties after clocks so that we keep alphabetic order and
> align with the other similar definitions.

Krzysztof had requested to change not just the DTSI but all instances for G=
S101
here:
https://lore.kernel.org/all/98810c49-38e6-4402-bd47-05d8cbc99ef3@linaro.org=
/

Cheers,
Andre'

