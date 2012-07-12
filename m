From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: [PATCH] ARM: samsung: adc: fix race in s3c_adc_start
Date: Thu, 12 Jul 2012 13:31:26 +0100
Message-ID: <20120712123125.GJ18513@trinity.fluff.org>
References: <1342059131-31251-1-git-send-email-toddpoynor@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1342059131-31251-1-git-send-email-toddpoynor@google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Todd Poynor <toddpoynor@google.com>
Cc: eunki_kim@samsung.com, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 11, 2012 at 07:12:11PM -0700, Todd Poynor wrote:
> Checking for adc->ts_pend already claimed should be done with the
> lock held.
> 
> Change-Id: Ic9f15e26bd19934ab8c2885ce5df265933ac304a
> Signed-off-by: Todd Poynor <toddpoynor@google.com>
Acked-by: Ben Dooks <ben-linux@fluff.org>
