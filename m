From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 10/14] s3c-camif: Check if fmt is NULL before use
Date: Wed, 29 Apr 2015 11:03:36 +0200
Message-ID: <55409E68.30006@samsung.com>
References: <ea067cc285e015d6ba90554d650b0a9df2670252.1430235781.git.mchehab@osg.samsung.com>
 <14da8840d09d05132cc6183b85cffecb71f2bde4.1430235781.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <14da8840d09d05132cc6183b85cffecb71f2bde4.1430235781.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 28/04/15 17:43, Mauro Carvalho Chehab wrote:
> As reported by smatch:
> 	drivers/media/platform/s3c-camif/camif-capture.c:463 queue_setup() warn: variable dereferenced before check 'fmt' (see line 460)
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
