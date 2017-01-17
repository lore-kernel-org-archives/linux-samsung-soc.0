From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] usb: dwc3 dwc3_exynos_probe() change goto labels to
 meaningful names
Date: Tue, 17 Jan 2017 15:09:34 -0700
Message-ID: <8eab294d-5262-63d4-c694-afa2df29cab1@osg.samsung.com>
References: <20170111164537.2981-1-shuahkh@osg.samsung.com>
 <87ziirmgz1.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87ziirmgz1.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/16/2017 03:33 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Shuah Khan <shuahkh@osg.samsung.com> writes:
>> Change goto labels to meaningful names from a series of errNs.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> 
> doesn't apply to testing/next, please rebase.
> 

Hi Felipe,

This patch is dependent on the

usb: dwc3: exynos fix axius clock error path to do cleanup
https://lkml.org/lkml/2017/1/10/1081

The above made it into usb-linus. It will apply to usb-next
or usb-testing after it gets merged. I can resend it after
the dependent patch makes it into the next rc release.

thanks,
-- Shuah
