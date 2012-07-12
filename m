From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: samsung: adc: fix race in s3c_adc_start
Date: Fri, 13 Jul 2012 07:41:11 +0900
Message-ID: <4FFF5287.8000608@samsung.com>
References: <1342059131-31251-1-git-send-email-toddpoynor@google.com>
 <20120712123125.GJ18513@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120712123125.GJ18513@trinity.fluff.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, eunki_kim@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Todd Poynor <toddpoynor@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/12/12 21:31, Ben Dooks wrote:
> On Wed, Jul 11, 2012 at 07:12:11PM -0700, Todd Poynor wrote:
>> Checking for adc->ts_pend already claimed should be done with the
>> lock held.
>>
>> Change-Id: Ic9f15e26bd19934ab8c2885ce5df265933ac304a
>> Signed-off-by: Todd Poynor<toddpoynor@google.com>
> Acked-by: Ben Dooks<ben-linux@fluff.org>

Ben, thanks for your ack, will apply.

BTW, Todd, do you want to keep the 'Change-Id' in mainline?
If you don't mind, I'd like to remove it...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
