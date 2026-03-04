Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C6389117
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Mar 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668621; cv=none; b=Mc/PILiUN8r2gc0Vpvmmz1VeV5c4szCkh3I70C2niEusHgRfqyeBGKorwAZClNIaNGPWNEbpjXCEcVMH7hjsF5wzXfrSB0U5MotvWy4gRFluQvFZRnU4VHxsHErkNgF0FOs0smRuP//0Bk9Stveae1qMKkNoAyHjsTTCL5BsZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668621; c=relaxed/simple;
	bh=Q0RmGTaWyrNXkoqSRC4NOGoeVMXVms2krIlt4cMtsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa3Uu2Zh7fT0LXRnDumKOALfyHi7e5lV3E3yNNMmTSN3yAtEtZC52YxYsmlwNviLEqBAnoFYHKtUUnPyaBvDkIFTRZa4x7/UV7VspkhDQU2De+3B1VO4lN15r5d4+PHgC97Ius2wIzxn9tBSB7z4Wcsqp3YF9t/EUpVR92IRpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3gyhoDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR1vjbCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3gyhoDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR1vjbCK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624G2LQE036097
	for <linux-samsung-soc@vger.kernel.org>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwg99h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c711251ac5so4436843585a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=gR1vjbCKyyJ3o6dh/LzYtaTxAoe5c/LIKUCblHAON8BYJvNITHkv8oFo/DbiCRUIAO
         Q33H5pvJQ+hJNSyk+JOjoxonBKp56j/eStzc/dlR4xsCa0GWNOgznsm3tOdIopw1Hf98
         jjrnjeVnwm8drXGmiiD5Mkq05MjXvfm1Qnz7GbN9NVyLa9c7OHa9JLKTppRFHXd6eUBD
         BQrdctaQEDOu6udxmmKZcxQx46ouzDeA+QLx6D24K7tad9YN1b0WbcJFEOu2+Koi+bS7
         WTgpDbqdDklDlpFeHqq6sgAIrQ1uahog1mPwNTb6PJFKLBjNLMzIMCOHCGtSSJGCpPEe
         OGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=gMpXK4wGciX17B3UVnYKJUhw/lhKxVbdivfonLLVD79GhauuuAdlq7Ad7BhPKLzcUy
         L4xqw8WlbIt8dTTeeIrgYMfoTlqkr2nQ9Nfyuatczaf+kAxFDfv6LzOefsGexRrjePQb
         YNmHkypqH0ixZogYK9lMcXnk64TdXaFq8ZQWUKAc7AEBiE2M/vjtMBbfNXe69ULcDwrl
         /l6usuoR4fyTj15o69m7X9aW1JClghGVjUumbxwNsPzCOLXve9j0w2ujQqp8J6MG+ojl
         3Iec1ZOUkAvqfZiahdwbu6lO7vM/j0hqy7tHcK6uZ6KiXWWeOJo9X7jdGe7szgoN7+Ck
         rdgw==
X-Forwarded-Encrypted: i=1; AJvYcCXniCcuPT7dymt9xNaeRVFjlKUh7qBqASTMKD/rmAxslOAzpODLy/LhbdNFqgdfH1wTS8Y/AqTXbLJCxWOsJVfAqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWn/6ndSKxM7CFUMZWHsj3q8ZRbAjEdrEbre0oNjv08CUuQVsh
	RMRxiICuYRlZiioLckM25Xjz+5MkLSH4Pi2lca30RXWKw59hy7Cbiedfh6fziDEEXZvqXjI1Vhw
	N4DdzoVIAwSm6GGcX9Pfmw/TiOf+IBStLVmoye8ULAL/8ouK/gKmb+p+EsYewoNQJRCQ08lP9gA
	==
X-Gm-Gg: ATEYQzyzqKgQtltk9oNB2OKGL+gxexYPzuk+rBHwdPpwT+8tPwWMfSfVWEgM+iyjrNw
	30yMmSaJsm//0QjZII+O44ixVX9OMOyjCmv1XysdG99o54wm7qlXjTiHFHSOzZzterezR8zC0uz
	xBpT7n+337gG+s7gyPmm1DR18BChxDCfiw7u00IKZQl97gYE3IlYvvrsSoQHQyFqT6rP+et4Se0
	7/c/5QHc+NNqCubjK1PWTCvs5qZDJlTHhMuyzd1UrmKpxTXWgcrBk2fl3gzAkivA0gB5byjWqb2
	S8N4kre/geAgjSf+y2Bag/b7m+G0F+VUYAyt+AmmxfHFqDWAQWqEWldD7pAZgSItWytycSIM/FE
	I6DaqpgdZNWZYKidL2C9NYb2fO7+ZK+ccCJvXK4q1Ns0M6+8oDEhncb5LPTPkxvrs/pOJeiTGpT
	D/7el6kK4byLatxh77DuSuwpl89Itqbr2VmNU=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481317385a.40.1772668618462;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: odT--9CJbi8IBIrPAbz7qIXz4CeZv73G
X-Proofpoint-ORIG-GUID: odT--9CJbi8IBIrPAbz7qIXz4CeZv73G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX7vLiSNB01ZYA
 0pHe3wAfeYsMXXCGYmFWxOj7x/2DnKIefJUXChaRAF1AT87xArmA1cHC25IbzAOuFfj9xdP6D3y
 KjFwNEA9s3oVu7Onvptd9mQHgTzyqDPG3xmigX3RJczao2HH/MQKpfat65ENRwMmQyDmRx3NdXn
 bDZr57ao+yX+Nyb4EFuYgNhGwe+CXOIkKnIviydc7B06JB1jEdY16grSDjRbPiTzAbOksrng2Eh
 BSiDDC2jo25dcYJEjX7H08svFrh2f5KSkd7CJDjp6zxqo1X9eeohPZmtiRZ0mePKHbIVZaoK0+A
 GwWB8b/sMTREBvaddbz+vVCipbubTyo7gVQ2uoYTlLI8x1o8nUk6vXx7hcBAIot11zHMkVPMMJN
 k7y9B4eF5sI2o1E+ffyviswmQMSxfuzhqQOReDYnmjtwNhBLbzOyKO0xrREFOxgn4LJAy+fy38g
 AM3Obe7/rGJLwOR3dQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
